import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sdsd_model.dart';
export 'sdsd_model.dart';

/// Create a FlutterFlow page titled "Success Partner Registration" with the
/// following elements:
///
/// - At the top, a welcoming headline: "Welcome to Become a Success Partner"
/// - Below the headline, a short paragraph explaining the benefits:
///   "Join us as a Success Partner to enhance our service quality and
/// accelerate outreach, whether you are a government entity, a company, or an
/// individual."
/// - Use clear and friendly language.
///
/// - Add a visually appealing icon or illustration related to partnership or
/// growth near the text.
/// - Below the explanation, include a prominent button labeled "Register
/// Now".
/// - The page design should be clean, professional, and inviting, with
/// sufficient padding and modern typography.
/// - Use soft background colors and rounded corners for a friendly look.
/// - Center all content vertically and horizontally on the page.
class SdsdWidget extends StatefulWidget {
  const SdsdWidget({super.key});

  static String routeName = 'sdsd';
  static String routePath = '/sdsd';

  @override
  State<SdsdWidget> createState() => _SdsdWidgetState();
}

class _SdsdWidgetState extends State<SdsdWidget> {
  late SdsdModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SdsdModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'o0w2rk44' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).labelMediumIsCustom,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: const SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
