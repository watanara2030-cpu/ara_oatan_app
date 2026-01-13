import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pay_moyser_o_k_widget.dart' show PayMoyserOKWidget;
import 'package:flutter/material.dart';

class PayMoyserOKModel extends FlutterFlowModel<PayMoyserOKWidget> {
  ///  Local state fields for this page.

  bool isPay = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (myserGet)] action in payMoyserOK widget.
  ApiCallResponse? apiResult5yz;
  // Stores action output result for [Firestore Query - Query a collection] action in payMoyserOK widget.
  int? conOrder;
  // Stores action output result for [Firestore Query - Query a collection] action in payMoyserOK widget.
  List<UserRecord>? mnadebList;
  // Stores action output result for [Firestore Query - Query a collection] action in payMoyserOK widget.
  int? comnadeb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
