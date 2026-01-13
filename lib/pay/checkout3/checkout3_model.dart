import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'checkout3_widget.dart' show Checkout3Widget;
import 'package:flutter/material.dart';

class Checkout3Model extends FlutterFlowModel<Checkout3Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0jhfl768' /* Your Name is required */,
      );
    }

    return null;
  }

  // State field(s) for ncard widget.
  FocusNode? ncardFocusNode;
  TextEditingController? ncardTextController;
  String? Function(BuildContext, String?)? ncardTextControllerValidator;
  String? _ncardTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8poy6zso' /* رقم البطاقة is required */,
      );
    }

    return null;
  }

  // State field(s) for yers_card widget.
  FocusNode? yersCardFocusNode;
  TextEditingController? yersCardTextController;
  String? Function(BuildContext, String?)? yersCardTextControllerValidator;
  String? _yersCardTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1djvsgmp' /* سنة الإنتهاء is required */,
      );
    }

    return null;
  }

  // State field(s) for month_card widget.
  FocusNode? monthCardFocusNode1;
  TextEditingController? monthCardTextController1;
  String? Function(BuildContext, String?)? monthCardTextController1Validator;
  String? _monthCardTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lleipro5' /* شهر الإنتهاء is required */,
      );
    }

    return null;
  }

  // State field(s) for month_card widget.
  FocusNode? monthCardFocusNode2;
  TextEditingController? monthCardTextController2;
  String? Function(BuildContext, String?)? monthCardTextController2Validator;
  String? _monthCardTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hk7holaj' /* CCV is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? vvv;
  // Stores action output result for [Backend Call - API (Create Invoice)] action in Button widget.
  ApiCallResponse? apiResulta7l;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  // State field(s) for Checcash widget.
  bool? checcashValue;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    ncardTextControllerValidator = _ncardTextControllerValidator;
    yersCardTextControllerValidator = _yersCardTextControllerValidator;
    monthCardTextController1Validator = _monthCardTextController1Validator;
    monthCardTextController2Validator = _monthCardTextController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    ncardFocusNode?.dispose();
    ncardTextController?.dispose();

    yersCardFocusNode?.dispose();
    yersCardTextController?.dispose();

    monthCardFocusNode1?.dispose();
    monthCardTextController1?.dispose();

    monthCardFocusNode2?.dispose();
    monthCardTextController2?.dispose();
  }
}
