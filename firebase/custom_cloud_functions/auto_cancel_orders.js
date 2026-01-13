const functions = require("firebase-functions");
const admin = require("firebase-admin");

if (!admin.apps.length) {
  admin.initializeApp();
}

exports.autoCancelOrders = functions.pubsub
  .schedule("every 1 minutes") // الفحص كل دقيقة (طبيعي)
  .timeZone("Asia/Riyadh")
  .onRun(async () => {
    try {
      const nowMs = Date.now();
      const sixtyMinutesMs = 60 * 60 * 1000; // 60 دقيقة

      const ordersRef = admin.firestore().collection("order");

      const snapshot = await ordersRef
        .where("halh_text", "==", "بإنتظار قبول المندوب")
        .get();

      if (snapshot.empty) {
        console.log("No orders awaiting acceptance.");
        return null;
      }

      const updates = [];

      snapshot.forEach((doc) => {
        const data = doc.data();

        if (!data.data_order) return;

        const orderTimeMs = data.data_order.toMillis
          ? data.data_order.toMillis()
          : new Date(data.data_order).getTime();

        if (isNaN(orderTimeMs)) return;

        // ✅ الإلغاء بعد 60 دقيقة
        if (nowMs - orderTimeMs >= sixtyMinutesMs) {
          updates.push(
            doc.ref.update({
              halh_text: "ملغي",
              cancelled_at: admin.firestore.FieldValue.serverTimestamp(),
            }),
          );
        }
      });

      if (updates.length) {
        await Promise.all(updates);
        console.log(`Cancelled ${updates.length} orders after 60 minutes.`);
      }

      return null;
    } catch (error) {
      console.error("autoCancelOrders error:", error);
      throw error;
    }
  });
