import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'panel_model.dart';
export 'panel_model.dart';

/// Top Section:
///
/// A centered button at the top labeled: "Add New Landmark".
///
/// Main Section:
///
/// A table displaying the list of added landmarks with the following
/// features:
/// Search Bar: To filter landmarks by keyword.
/// Sorting Options: To organize landmarks by criteria like name, country, or
/// city.
/// Table columns include:
/// Landmark Image
/// Landmark Name
/// Country
/// City
/// Edit Button
/// Delete Button
/// Does this structure meet your needs? Let me know if you need any
/// refinements!
class PanelWidget extends StatefulWidget {
  const PanelWidget({super.key});

  static String routeName = 'panel';
  static String routePath = '/panel';

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  late PanelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanelModel());

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
          backgroundColor: FlutterFlowTheme.of(context).secondary,
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
              'dshasjqu' /* Page Title */,
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
      ),
    );
  }
}
