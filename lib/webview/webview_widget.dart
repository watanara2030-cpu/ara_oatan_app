import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'webview_model.dart';
export 'webview_model.dart';

class WebviewWidget extends StatefulWidget {
  const WebviewWidget({
    super.key,
    required this.url,
  });

  final String? url;

  static String routeName = 'webview';
  static String routePath = '/webview';

  @override
  State<WebviewWidget> createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  late WebviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebviewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'xnttfo6b' /* Pay the reservation fee */,
              ),
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'cairo',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 3.0, 0.0, 3.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Future.wait([
                            Future(() async {
                              if (FFAppState().TypeHgzPAYMOYSER ==
                                  TypeHgz.Rhlh) {
                                _model.apimyserGet = await MyserGetCall.call(
                                  id: FFAppState().PayMyserid,
                                );

                                if (MyserGetCall.halh(
                                      (_model.apimyserGet?.jsonBody ?? ''),
                                    ) ==
                                    'paid') {
                                  FFAppState().DonePay = true;
                                  FFAppState().update(() {});
                                  _model.ngl2 = await querySettingsRecordOnce(
                                    queryBuilder: (settingsRecord) =>
                                        settingsRecord.where(
                                      'id',
                                      isEqualTo: 1,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _model.conOrder =
                                      await queryOrderRecordCount();
                                  if (FFAppState().DriverGuideState == true) {
                                    var orderRecordReference1 =
                                        OrderRecord.collection.doc();
                                    await orderRecordReference1.set({
                                      ...createOrderRecordData(
                                        total: FFAppState().totalAllnow3,
                                        user: currentUserReference,
                                        lokeshn: FFAppState().mkanuserorder,
                                        dataOrder: getCurrentTimestamp,
                                        cartext: FFAppState().tebycar,
                                        carRev: FFAppState().typecarRev,
                                        naimUserText: currentUserDisplayName,
                                        phoneNumper: valueOrDefault(
                                            currentUserDocument?.phoneN, 0),
                                        addCartNumer: FFAppState().addcart,
                                        villText: FFAppState().villtextnow,
                                        citiesUserNow: FFAppState().villnow,
                                        totalTaim: FFAppState().totalsaat,
                                        vill: FFAppState().villnow,
                                        iDorder:
                                            ((_model.conOrder!) + 1).toString(),
                                        halhOrder: Halh.Pending,
                                        schedule: FFAppState().dataSchedule,
                                        fullSchedule:
                                            FFAppState().fulltextSchedule,
                                        halhText: 'بإنتظار قبول المندوب',
                                        totalApp: FFAppState().totalapp2,
                                        totalVat: FFAppState().vat2,
                                        halh: 'بإنتظار قبول المندوب',
                                        imgProfileClent: currentUserPhoto,
                                        loceshStreng: FFAppState()
                                            .mkanuserorder
                                            ?.toString(),
                                        allnow: true,
                                        activeOrder: false,
                                        totalMndob2: FFAppState().totalmndob3,
                                        ksm: FFAppState().totalKsm2,
                                        driverGuide: true,
                                        reviewMndonsend: false,
                                        retengUser: valueOrDefault<double>(
                                          functions
                                              .averageRating(
                                                  (currentUserDocument?.reteng
                                                              .toList() ??
                                                          [])
                                                      .toList())
                                              ?.toDouble(),
                                          0.0,
                                        ),
                                        srSAAH:
                                            FFAppState().srtypecar.toDouble(),
                                        paymentMethod:
                                            PaymentMethod.OnlinePayment,
                                        idMoyser: MyserGetCall.id(
                                          (_model.apimyserGet?.jsonBody ?? ''),
                                        ),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'listAmakn':
                                              getAmaknCostmListFirestoreData(
                                            FFAppState().cartmkss,
                                          ),
                                        },
                                      ),
                                    });
                                    _model.gule =
                                        OrderRecord.getDocumentFromData({
                                      ...createOrderRecordData(
                                        total: FFAppState().totalAllnow3,
                                        user: currentUserReference,
                                        lokeshn: FFAppState().mkanuserorder,
                                        dataOrder: getCurrentTimestamp,
                                        cartext: FFAppState().tebycar,
                                        carRev: FFAppState().typecarRev,
                                        naimUserText: currentUserDisplayName,
                                        phoneNumper: valueOrDefault(
                                            currentUserDocument?.phoneN, 0),
                                        addCartNumer: FFAppState().addcart,
                                        villText: FFAppState().villtextnow,
                                        citiesUserNow: FFAppState().villnow,
                                        totalTaim: FFAppState().totalsaat,
                                        vill: FFAppState().villnow,
                                        iDorder:
                                            ((_model.conOrder!) + 1).toString(),
                                        halhOrder: Halh.Pending,
                                        schedule: FFAppState().dataSchedule,
                                        fullSchedule:
                                            FFAppState().fulltextSchedule,
                                        halhText: 'بإنتظار قبول المندوب',
                                        totalApp: FFAppState().totalapp2,
                                        totalVat: FFAppState().vat2,
                                        halh: 'بإنتظار قبول المندوب',
                                        imgProfileClent: currentUserPhoto,
                                        loceshStreng: FFAppState()
                                            .mkanuserorder
                                            ?.toString(),
                                        allnow: true,
                                        activeOrder: false,
                                        totalMndob2: FFAppState().totalmndob3,
                                        ksm: FFAppState().totalKsm2,
                                        driverGuide: true,
                                        reviewMndonsend: false,
                                        retengUser: valueOrDefault<double>(
                                          functions
                                              .averageRating(
                                                  (currentUserDocument?.reteng
                                                              .toList() ??
                                                          [])
                                                      .toList())
                                              ?.toDouble(),
                                          0.0,
                                        ),
                                        srSAAH:
                                            FFAppState().srtypecar.toDouble(),
                                        paymentMethod:
                                            PaymentMethod.OnlinePayment,
                                        idMoyser: MyserGetCall.id(
                                          (_model.apimyserGet?.jsonBody ?? ''),
                                        ),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'listAmakn':
                                              getAmaknCostmListFirestoreData(
                                            FFAppState().cartmkss,
                                          ),
                                        },
                                      ),
                                    }, orderRecordReference1);
                                    _model.ccc2 =
                                        await queryPaymenthistoryRecordCount();

                                    await PaymenthistoryRecord.collection
                                        .doc()
                                        .set(createPaymenthistoryRecordData(
                                          id: (_model.ccc2!) + 5,
                                          revOrder: _model.gule?.reference,
                                          revUser: currentUserReference,
                                          osf:
                                              'تمت عملية الدفع لحجز رحلة حسب معرفة السائق  عدد الساعات  ${_model.orderrr2?.addSaat.toString()} ساعة/ساعات إضافية - ',
                                          dateAdd: getCurrentTimestamp,
                                          total: FFAppState().totalSaatEXTRA,
                                        ));
                                  } else {
                                    var orderRecordReference2 =
                                        OrderRecord.collection.doc();
                                    await orderRecordReference2.set({
                                      ...createOrderRecordData(
                                        total: FFAppState().totalAllnow3,
                                        user: currentUserReference,
                                        lokeshn: FFAppState().mkanuserorder,
                                        dataOrder: getCurrentTimestamp,
                                        cartext: FFAppState().tebycar,
                                        carRev: FFAppState().typecarRev,
                                        naimUserText: currentUserDisplayName,
                                        phoneNumper: valueOrDefault(
                                            currentUserDocument?.phoneN, 0),
                                        addCartNumer: FFAppState().addcart,
                                        villText: FFAppState().villtextnow,
                                        citiesUserNow: FFAppState().villnow,
                                        totalTaim: FFAppState().totalsaat,
                                        vill: FFAppState().villnow,
                                        iDorder:
                                            ((_model.conOrder!) + 1).toString(),
                                        halhOrder: Halh.Pending,
                                        schedule: FFAppState().dataSchedule,
                                        fullSchedule:
                                            FFAppState().fulltextSchedule,
                                        halhText: 'بإنتظار قبول المندوب',
                                        totalApp: FFAppState().totalapp2,
                                        totalVat: FFAppState().vat2,
                                        halh: 'بإنتظار قبول المندوب',
                                        imgProfileClent: currentUserPhoto,
                                        loceshStreng: FFAppState()
                                            .mkanuserorder
                                            ?.toString(),
                                        allnow: true,
                                        activeOrder: false,
                                        totalMndob2: FFAppState().totalmndob3,
                                        ksm: FFAppState().totalKsm2,
                                        driverGuide: false,
                                        reviewMndonsend: false,
                                        retengUser: valueOrDefault<double>(
                                          functions
                                              .averageRating(
                                                  (currentUserDocument?.reteng
                                                              .toList() ??
                                                          [])
                                                      .toList())
                                              ?.toDouble(),
                                          0.0,
                                        ),
                                        srSAAH:
                                            FFAppState().srtypecar.toDouble(),
                                        paymentMethod:
                                            PaymentMethod.OnlinePayment,
                                        idMoyser: MyserGetCall.id(
                                          (_model.apimyserGet?.jsonBody ?? ''),
                                        ),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'listAmakn':
                                              getAmaknCostmListFirestoreData(
                                            FFAppState().cartmkss,
                                          ),
                                        },
                                      ),
                                    });
                                    _model.noGul =
                                        OrderRecord.getDocumentFromData({
                                      ...createOrderRecordData(
                                        total: FFAppState().totalAllnow3,
                                        user: currentUserReference,
                                        lokeshn: FFAppState().mkanuserorder,
                                        dataOrder: getCurrentTimestamp,
                                        cartext: FFAppState().tebycar,
                                        carRev: FFAppState().typecarRev,
                                        naimUserText: currentUserDisplayName,
                                        phoneNumper: valueOrDefault(
                                            currentUserDocument?.phoneN, 0),
                                        addCartNumer: FFAppState().addcart,
                                        villText: FFAppState().villtextnow,
                                        citiesUserNow: FFAppState().villnow,
                                        totalTaim: FFAppState().totalsaat,
                                        vill: FFAppState().villnow,
                                        iDorder:
                                            ((_model.conOrder!) + 1).toString(),
                                        halhOrder: Halh.Pending,
                                        schedule: FFAppState().dataSchedule,
                                        fullSchedule:
                                            FFAppState().fulltextSchedule,
                                        halhText: 'بإنتظار قبول المندوب',
                                        totalApp: FFAppState().totalapp2,
                                        totalVat: FFAppState().vat2,
                                        halh: 'بإنتظار قبول المندوب',
                                        imgProfileClent: currentUserPhoto,
                                        loceshStreng: FFAppState()
                                            .mkanuserorder
                                            ?.toString(),
                                        allnow: true,
                                        activeOrder: false,
                                        totalMndob2: FFAppState().totalmndob3,
                                        ksm: FFAppState().totalKsm2,
                                        driverGuide: false,
                                        reviewMndonsend: false,
                                        retengUser: valueOrDefault<double>(
                                          functions
                                              .averageRating(
                                                  (currentUserDocument?.reteng
                                                              .toList() ??
                                                          [])
                                                      .toList())
                                              ?.toDouble(),
                                          0.0,
                                        ),
                                        srSAAH:
                                            FFAppState().srtypecar.toDouble(),
                                        paymentMethod:
                                            PaymentMethod.OnlinePayment,
                                        idMoyser: MyserGetCall.id(
                                          (_model.apimyserGet?.jsonBody ?? ''),
                                        ),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'listAmakn':
                                              getAmaknCostmListFirestoreData(
                                            FFAppState().cartmkss,
                                          ),
                                        },
                                      ),
                                    }, orderRecordReference2);
                                    _model.ccc3 =
                                        await queryPaymenthistoryRecordCount();

                                    await PaymenthistoryRecord.collection
                                        .doc()
                                        .set(createPaymenthistoryRecordData(
                                          id: (_model.ccc3!) + 5,
                                          revOrder: _model.noGul?.reference,
                                          revUser: currentUserReference,
                                          osf:
                                              ' تمت عملية الدفع لحجز رحلة   ${_model.noGul?.totalTaim.toString()} ساعة/ساعات إضافية - ',
                                          dateAdd: getCurrentTimestamp,
                                          total: FFAppState().totalSaatEXTRA,
                                        ));
                                  }

                                  _model.mnadebList3 =
                                      await queryUserRecordOnce(
                                    queryBuilder: (userRecord) => userRecord
                                        .where(
                                          'mndob_vill',
                                          isEqualTo: FFAppState().villnow,
                                        )
                                        .where(
                                          'actev_mndob',
                                          isEqualTo: true,
                                        )
                                        .where(
                                          'ismndom',
                                          isEqualTo: true,
                                        )
                                        .where(
                                          'ismndob',
                                          isEqualTo: true,
                                        )
                                        .where(
                                          'mndob_type_car',
                                          isEqualTo: FFAppState().typecarRev,
                                        )
                                        .where(
                                          'ngl',
                                          isEqualTo: _model.ngl2?.ngl,
                                        ),
                                  );
                                  _model.mnaden = _model.mnadebList3?.length;
                                  safeSetState(() {});
                                  for (int loop1Index = 0;
                                      loop1Index <= _model.mnadebList3!.length;
                                      loop1Index++) {
                                    final currentLoop1Item = _model.mnadebList3!
                                        .map((e) => e)
                                        .toList()[loop1Index];
                                    if (_model.mnaden == 0) {
                                      break;
                                    } else {
                                      _model.apiResultdy8 = await WatcCall.call(
                                        to: currentLoop1Item.phoneNumber,
                                        msg:
                                            'السلام عليكم أ/ نفيدكم بوجود طلب جديد في تطبيق \"توري تاكسي\" لمدة *${FFAppState().totalsaat.toString()}ساعات  *مع عائد مالي قدره *${FFAppState().totalmndob3.toString()}${FFAppState().RMZCurrency}*                    نرجو منكم التكرم بقبول الطلب من خلال الدخول إلى التطبيق في أقرب وقت ممكن.مع خالص التحية والتقدير،\"                              فريق دعم تطبيق \"أرى وطن ( هذه الرسالة تمت بشكل ألي من خلال التطبيق (',
                                      );

                                      _model.mnaden = (_model.mnaden!) - 1;
                                      safeSetState(() {});
                                    }
                                  }
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: const Text('إغلاق'),
                                                  content: const Text(
                                                      'هل أنت متأكد من إغلاق الصفحة؟ '),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: const Text('لا'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: const Text('نعم'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    context.pushNamed(
                                      PayMoyserOKWidget.routeName,
                                      queryParameters: {
                                        'mnwebView': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                } else {
                                  FFAppState().DonePay = false;
                                  FFAppState().update(() {});
                                }

                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: const Text('إغلاق'),
                                                content: const Text(
                                                    'هل أنت متأكد من إغلاق الصفحة؟ '),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: const Text('لا'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: const Text('نعم'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  context.pushNamed(
                                    PayMoyserOKWidget.routeName,
                                    queryParameters: {
                                      'mnwebView': serializeParam(
                                        true,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              }
                            }),
                            Future(() async {
                              if (FFAppState().TypeHgzPAYMOYSER ==
                                  TypeHgz.Saat) {
                                _model.apimyserGet2 = await MyserGetCall.call(
                                  id: FFAppState().PayMyserid,
                                );

                                if (MyserGetCall.halh(
                                      (_model.apimyserGet2?.jsonBody ?? ''),
                                    ) ==
                                    'paid') {
                                  FFAppState().DonePay = true;
                                  FFAppState().update(() {});

                                  var extraHoursRecordReference =
                                      ExtraHoursRecord.collection.doc();
                                  await extraHoursRecordReference
                                      .set(createExtraHoursRecordData(
                                    revUser: currentUserReference,
                                    revOrder: FFAppState().revOrderSaatExtr,
                                    revMndob: FFAppState().RevMndonSaatExtra,
                                    addSaat: FFAppState().NumberSaatExtra,
                                    total: FFAppState().totalSaatEXTRA,
                                    dateAdd: getCurrentTimestamp,
                                    halh: HalhOrder.Completed,
                                    idPymentMoyser: MyserGetCall.id(
                                      (_model.apimyserGet2?.jsonBody ?? ''),
                                    ),
                                    idOrder: FFAppState().idOrderSaatEXtra,
                                  ));
                                  _model.orderrr2 =
                                      ExtraHoursRecord.getDocumentFromData(
                                          createExtraHoursRecordData(
                                            revUser: currentUserReference,
                                            revOrder:
                                                FFAppState().revOrderSaatExtr,
                                            revMndob:
                                                FFAppState().RevMndonSaatExtra,
                                            addSaat:
                                                FFAppState().NumberSaatExtra,
                                            total: FFAppState().totalSaatEXTRA,
                                            dateAdd: getCurrentTimestamp,
                                            halh: HalhOrder.Completed,
                                            idPymentMoyser: MyserGetCall.id(
                                              (_model.apimyserGet2?.jsonBody ??
                                                  ''),
                                            ),
                                            idOrder:
                                                FFAppState().idOrderSaatEXtra,
                                          ),
                                          extraHoursRecordReference);
                                  _model.ccc =
                                      await queryPaymenthistoryRecordCount();

                                  await PaymenthistoryRecord.collection
                                      .doc()
                                      .set(createPaymenthistoryRecordData(
                                        id: (_model.ccc!) + 5,
                                        revOrder: _model.orderrr2?.revOrder,
                                        revUser: currentUserReference,
                                        osf:
                                            ' تمت عملية الدفع لزيادة عدد الساعات إلى  ${_model.orderrr2?.addSaat.toString()} ساعة/ساعات إضافية - ',
                                        dateAdd: getCurrentTimestamp,
                                        total: FFAppState().totalSaatEXTRA,
                                      ));
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: const Text('إغلاق'),
                                                  content: const Text(
                                                      'هل أنت متأكد من إغلاق الصفحة؟ '),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: const Text('لا'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: const Text('نعم'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    context.pushNamed(
                                      PayMoyserOKWidget.routeName,
                                      queryParameters: {
                                        'mnwebView': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                } else {
                                  FFAppState().DonePay = false;
                                  FFAppState().update(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: const Text('إغلاق'),
                                                  content: const Text(
                                                      'هل أنت متأكد من إغلاق الصفحة؟ '),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: const Text('لا'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: const Text('نعم'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    context.pushNamed(
                                      PayMoyserOKWidget.routeName,
                                      queryParameters: {
                                        'mnwebView': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                }
                              }
                            }),
                          ]);

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'mu3vm7cj' /* Close Page */,
                        ),
                        icon: const Icon(
                          Icons.close,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 30.4,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'cairo',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              3.0, 2.0, 3.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'b9sdhl84' /* Please do not close the page u... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).error,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                FlutterFlowWebView(
                  content: widget.url!,
                  bypass: false,
                  height: MediaQuery.sizeOf(context).height * 1.033,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
