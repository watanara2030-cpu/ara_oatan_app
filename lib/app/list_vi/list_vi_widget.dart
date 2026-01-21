import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'list_vi_model.dart';
export 'list_vi_model.dart';

/// خانة للبحث اول الصفحة
class ListViWidget extends StatefulWidget {
  const ListViWidget({
    super.key,
    required this.cite,
  });

  final DocumentReference? cite;

  static String routeName = 'List_vi';
  static String routePath = '/listVi';

  @override
  State<ListViWidget> createState() => _ListViWidgetState();
}

class _ListViWidgetState extends State<ListViWidget>
    with TickerProviderStateMixin {
  late ListViModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.sser = false;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 60.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.95, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 510.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 510.0.ms,
            begin: const Offset(30.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 450.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(60.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 40.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'choiceChipsOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 380.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'listViewOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

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

    return StreamBuilder<List<MkanRecord>>(
      stream: queryMkanRecord(
        queryBuilder: (mkanRecord) => mkanRecord
            .where(
              'acctev',
              isEqualTo: true,
            )
            .where(
              'id_vill',
              isEqualTo: FFAppState().villa,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitChasingDots(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<MkanRecord> listViMkanRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(22.0),
                         
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 33.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'تتصفح الآن ${FFAppState().naimdolh}',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w100,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 11.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                AldolWidget.routeName);
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'gre0xlvp' /* Change country */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]
                                    .divide(const SizedBox(height: 4.0))
                                    .around(const SizedBox(height: 4.0)),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(width: 16.0))
                              .around(const SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    DemoDWidget.routeName,
                                    queryParameters: {
                                      'isSpeed': serializeParam(
                                        true,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.location_on,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 25.0,
                                    ),
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'hv2r3qq4' /* Start */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                    ),
                                    subtitle: Text(
                                      FFLocalizations.of(context).getText(
                                        'iv445i6q' /* Start from your current locati... */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelMediumIsCustom,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(ListWidget.routeName);
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.location_on,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 25.0,
                                    ),
                                    title: Text(
                                      FFAppState().naimvillatext,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                    ),
                                    subtitle: Text(
                                      FFLocalizations.of(context).getText(
                                        'phg4x7a8' /* Change city */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelMediumIsCustom,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    Citie2Widget.routeName,
                                    queryParameters: {
                                      'coun': serializeParam(
                                        FFAppState().dolh,
                                        ParamType.DocumentReference,
                                      ),
                                      'naim': serializeParam(
                                        FFAppState().naimdolh,
                                        ParamType.String,
                                      ),
                                      'idcit': serializeParam(
                                        FFAppState().dolh,
                                        ParamType.DocumentReference,
                                      ),
                                      'imgDolh': serializeParam(
                                        FFAppState().imgDolh,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.map,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 25.0,
                                    ),
                                    title: Text(
                                      valueOrDefault<String>(
                                        FFAppState().naimmdenh,
                                        'تغيير المنطقة',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                    ),
                                    subtitle: Text(
                                      FFLocalizations.of(context).getText(
                                        '1ntkntbh' /* Change region */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelMediumIsCustom,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (FFAppState().ismapview == false)
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(ListViCopyWidget.routeName);

                                    FFAppState().ismapview = true;
                                    safeSetState(() {});
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.map_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 25.0,
                                      ),
                                      title: Text(
                                        FFLocalizations.of(context).getText(
                                          'idqw5803' /* Browse the map */,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelLargeIsCustom,
                                            ),
                                      ),
                                      subtitle: Text(
                                        FFAppState().naimvillatext,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelMediumIsCustom,
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      dense: false,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (FFAppState().ismapview == true)
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      ListViWidget.routeName,
                                      queryParameters: {
                                        'cite': serializeParam(
                                          FFAppState().vil,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );

                                    FFAppState().ismapview = false;
                                    safeSetState(() {});
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.list_alt,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 25.0,
                                      ),
                                      title: Text(
                                        FFLocalizations.of(context).getText(
                                          'ldzvugtu' /* View list */,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelLargeIsCustom,
                                            ),
                                      ),
                                      subtitle: Text(
                                        'الأماكن في ${FFAppState().naimvillatext}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelMediumIsCustom,
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      dense: false,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(Checkout66Widget.routeName);
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.playlist_add,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 25.0,
                                    ),
                                    title: Text(
                                      FFAppState().addcart.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleLargeIsCustom,
                                          ),
                                    ),
                                    subtitle: Text(
                                      FFLocalizations.of(context).getText(
                                        'etis4wg7' /* Added destinations */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelMediumIsCustom,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                      List22TaskOverviewResponsiveWidget
                                          .routeName);
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.mail_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 25.0,
                                    ),
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'sahkayqn' /* My bookings */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                    ),
                                    subtitle: Text(
                                      FFLocalizations.of(context).getText(
                                        '5wwnncqm' /* Booking list. */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelMediumIsCustom,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(NewPlaceWidget.routeName);
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.add_to_photos,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 25.0,
                                    ),
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'cxgjrbn5' /* Suggest a Place */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleLargeIsCustom,
                                          ),
                                    ),
                                    subtitle: Text(
                                      FFLocalizations.of(context).getText(
                                        'h1mz2wy4' /* Add a Special Place */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelMediumIsCustom,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(AbutMdenhWidget.routeName);
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.sunny_snowing,
                                      color: Color(0xFFF2B507),
                                      size: 25.0,
                                    ),
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'fpsu953q' /* general information */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                    ),
                                    subtitle: Text(
                                      FFAppState().naimvillatext,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelMediumIsCustom,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: FutureBuilder<int>(
                                future: queryChatRecordCount(
                                  queryBuilder: (chatRecord) => chatRecord
                                      .where(
                                        'date',
                                        isEqualTo: getCurrentTimestamp,
                                      )
                                      .where(
                                        'user1',
                                        isNotEqualTo: currentUserReference,
                                      ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  int listTileCount = snapshot.data!;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          List22TaskOverviewResponsiveWidget
                                              .routeName);
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.mail_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                        title: Text(
                                          valueOrDefault<String>(
                                            listTileCount.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleLargeIsCustom,
                                              ),
                                        ),
                                        subtitle: Text(
                                          FFLocalizations.of(context).getText(
                                            '0fnyrgzh' /* رسائل جديدة */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .labelMediumIsCustom,
                                              ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 20.0,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(Profile05Widget.routeName);
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.settings_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 25.0,
                                    ),
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        'p6tqq44u' /* Settings */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(SupportWidget.routeName);
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.help_outline,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 25.0,
                                    ),
                                    title: Text(
                                      FFLocalizations.of(context).getText(
                                        '56gb4f6g' /* Help */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: 0.3,
                      child: Divider(
                        height: 1.0,
                        thickness: 0.75,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                                HomePagWidget.routeName, context.mounted);
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: Icon(
                                Icons.logout_rounded,
                                color: FlutterFlowTheme.of(context).error,
                                size: 25.0,
                              ),
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  '74c9fipn' /* Log Out */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelLargeFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelLargeIsCustom,
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              dense: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 10.0, 11.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.menu,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                  ),
                ],
              ),
              title: Text(
                '${FFAppState().naimmdenh}- ${FFAppState().naimvillatext}',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).labelLargeIsCustom,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Stack(
              children: [
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 500.0,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.05, -1.0),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1286&q=80',
                                    width: double.infinity,
                                    height: 500.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 500.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0x8D090F13),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (FFAppState().addcart >= 1)
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 22.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(16.0,
                                                              0.0, 16.0, 0.0),
                                                      child: Text(
                                                        '${FFLocalizations.of(context).getVariableText(
                                                          enText:
                                                              'Added Destinations: ',
                                                          arText:
                                                              'الوجهات المضافة: ',
                                                          zh_HansText:
                                                              'Added Destinations: ',
                                                          trText:
                                                              'Added Destinations: ',
                                                          urText:
                                                              'Added Destinations: ',
                                                          ruText:
                                                              'Added Destinations: ',
                                                          azText:
                                                              'Added Destinations: ',
                                                          kaText:
                                                              'Added Destinations: ',
                                                        )} ${FFAppState().addcart.toString()} ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLargeIsCustom,
                                                                ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textOnPageLoadAnimation1']!),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            Checkout66Widget
                                                                .routeName);
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'nkwn5fr9' /* View My Trip */,
                                                      ),
                                                      icon: const FaIcon(
                                                        FontAwesomeIcons
                                                            .glasses,
                                                        size: 11.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 31.76,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(16.0,
                                                                0.0, 16.0, 0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 0.0, 0.0),
                                                        iconColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize: 9.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  11.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  11.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  11.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  11.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 32.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 700.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(16.0),
                                                topRight: Radius.circular(16.0),
                                              ),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 8.0, 0.0, 24.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Divider(
                                                      height: 4.0,
                                                      thickness: 2.0,
                                                      indent: 140.0,
                                                      endIndent: 140.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(16.0,
                                                              16.0, 16.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'lhefc6ln' /* Experience top destinations */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textOnPageLoadAnimation2']!),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(16.0,
                                                              4.0, 16.0, 0.0),
                                                      child: Text(
                                                        FFAppState()
                                                            .naimvillatext,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textOnPageLoadAnimation3']!),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              12.0, 0.0, 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 210.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: StreamBuilder<
                                                            List<MkanRecord>>(
                                                          stream:
                                                              queryMkanRecord(
                                                            queryBuilder:
                                                                (mkanRecord) =>
                                                                    mkanRecord
                                                                        .where(
                                                                          'id_vill',
                                                                          isEqualTo:
                                                                              FFAppState().villa,
                                                                        )
                                                                        .where(
                                                                          'acctev',
                                                                          isEqualTo:
                                                                              true,
                                                                        )
                                                                        .where(
                                                                          'as_ads',
                                                                          isEqualTo:
                                                                              true,
                                                                        ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitChasingDots(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<MkanRecord>
                                                                listViewMkanRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(1),
                                                              primary: false,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listViewMkanRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewMkanRecord =
                                                                    listViewMkanRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        270.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              8.0,
                                                                          color:
                                                                              Color(0x230F1113),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            4.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              PlacedetailsWidget.routeName,
                                                                              queryParameters: {
                                                                                'mk': serializeParam(
                                                                                  listViewMkanRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'textnaim': serializeParam(
                                                                                  listViewMkanRecord.naim,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(12.0),
                                                                              topRight: Radius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                listViewMkanRecord.img1,
                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tutorial-multi-language-app-aavlbx/assets/666g545s9vh5/1077915.png',
                                                                              ),
                                                                              width: double.infinity,
                                                                              height: 110.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              16.0,
                                                                              12.0,
                                                                              16.0,
                                                                              12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      context.pushNamed(
                                                                                        PlacedetailsWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'mk': serializeParam(
                                                                                            listViewMkanRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'textnaim': serializeParam(
                                                                                            listViewMkanRecord.naim,
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Text(
                                                                                      listViewMkanRecord.naim,
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        RatingBarIndicator(
                                                                                          itemBuilder: (context, index) => Icon(
                                                                                            Icons.radio_button_checked_rounded,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                          direction: Axis.horizontal,
                                                                                          rating: 5.0,
                                                                                          unratedColor: FlutterFlowTheme.of(context).error,
                                                                                          itemCount: 5,
                                                                                          itemSize: 12.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FlutterFlowIconButton(
                                                                                    borderRadius: 6.0,
                                                                                    buttonSize: 33.0,
                                                                                    icon: Icon(
                                                                                      Icons.add_circle,
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      size: 12.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      if (FFAppState().mkan.contains(listViewMkanRecord.reference)) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'المكان مضاف مسبقًا.',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'cairo',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        FFAppState().addcart = FFAppState().addcart + 1;
                                                                                        FFAppState().addToCartmkss(AmaknCostmStruct(
                                                                                          naim: listViewMkanRecord.naim,
                                                                                          textivill: '${FFAppState().naimdolh}- ${FFAppState().naimvillatext}',
                                                                                          loceshn: listViewMkanRecord.location,
                                                                                          revmkan: listViewMkanRecord.reference,
                                                                                        ));
                                                                                        FFAppState().dataSchedule = getCurrentTimestamp;
                                                                                        FFAppState().fulltextSchedule = 'حجز فوري';
                                                                                        FFAppState().textallAlmdn = (String var1, String var2) {
                                                                                          return "$var1 $var2";
                                                                                        }(FFAppState().textallAlmdn, FFAppState().naimvillatext);
                                                                                        FFAppState().addToMkan(listViewMkanRecord.reference);
                                                                                        safeSetState(() {});
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'تمت إضافة : ${listViewMkanRecord.naim} بنجاح ',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                            action: SnackBarAction(
                                                                                              label: 'عرض رحلتي',
                                                                                              textColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              onPressed: () async {
                                                                                                context.pushNamed(Checkout66Widget.routeName);
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      if (FFAppState().mkan.contains(listViewMkanRecord.reference)) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'المكان مضاف مسبقًا.',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'cairo',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        FFAppState().addcart = FFAppState().addcart + 1;
                                                                                        FFAppState().addToCartmkss(AmaknCostmStruct(
                                                                                          naim: listViewMkanRecord.naim,
                                                                                          textivill: '${FFAppState().naimdolh}- ${FFAppState().naimvillatext}',
                                                                                          loceshn: listViewMkanRecord.location,
                                                                                          revmkan: listViewMkanRecord.reference,
                                                                                        ));
                                                                                        FFAppState().dataSchedule = getCurrentTimestamp;
                                                                                        FFAppState().fulltextSchedule = 'حجز فوري';
                                                                                        FFAppState().textallAlmdn = (String var1, String var2) {
                                                                                          return "$var1 $var2";
                                                                                        }(FFAppState().textallAlmdn, FFAppState().naimvillatext);
                                                                                        FFAppState().addToMkan(listViewMkanRecord.reference);
                                                                                        safeSetState(() {});
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'تمت إضافة : ${listViewMkanRecord.naim} بنجاح ',
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                            action: SnackBarAction(
                                                                                              label: 'عرض رحلتي',
                                                                                              textColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              onPressed: () async {
                                                                                                context.pushNamed(Checkout66Widget.routeName);
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                        FFAppState().akrLoceshn = listViewMkanRecord.location;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'assjes9i' /* Add */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'containerOnPageLoadAnimation']!),
                                                                );
                                                              },
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'listViewOnPageLoadAnimation1']!);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'swhxsz7h' /* Tourist landmarks */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              17.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                        ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'textOnPageLoadAnimation4']!),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        11.0,
                                                                        16.0,
                                                                        11.0),
                                                                child:
                                                                    FlutterFlowChoiceChips(
                                                                  options: [
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '0gjhqz6e' /* الكل */,
                                                                        ),
                                                                        Icons
                                                                            .density_small),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '1k6b2ubh' /* أماكن ترفيهية */,
                                                                        ),
                                                                        Icons
                                                                            .sentiment_satisfied_rounded),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'kmon2zgt' /* معالم سياحية */,
                                                                        ),
                                                                        Icons
                                                                            .restaurant),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'tnfmb52e' /* مقهى */,
                                                                        ),
                                                                        Icons
                                                                            .coffee_outlined),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '5p4hgnha' /* أماكن سياحية */,
                                                                        ),
                                                                        Icons
                                                                            .place_sharp),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'f6lkp6ha' /* أسواق */,
                                                                        ),
                                                                        Icons
                                                                            .shopping_cart_sharp),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'ek6uzd9t' /* جولة برية */,
                                                                        ),
                                                                        Icons
                                                                            .forest_outlined),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'icj3jzeb' /* جولة بحرية */,
                                                                        ),
                                                                        Icons
                                                                            .support),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'gpd0piir' /* فنادق */,
                                                                        ),
                                                                        Icons
                                                                            .hotel_sharp),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '6jn5bghr' /* مطاعم */,
                                                                        ),
                                                                        Icons
                                                                            .fastfood_rounded)
                                                                  ],
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.choiceChipsValue =
                                                                            val?.firstOrNull);
                                                                    _model.sser =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    iconSize:
                                                                        18.0,
                                                                    elevation:
                                                                        4.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    iconSize:
                                                                        18.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  chipSpacing:
                                                                      12.0,
                                                                  rowSpacing:
                                                                      12.0,
                                                                  multiselect:
                                                                      false,
                                                                  initialized:
                                                                      _model.choiceChipsValue !=
                                                                          null,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .choiceChipsValueController ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    [
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'jzw6suss' /* الكل */,
                                                                      )
                                                                    ],
                                                                  ),
                                                                  wrapped:
                                                                      false,
                                                                ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'choiceChipsOnPageLoadAnimation']!),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  7.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 345.55,
                                                                height: 41.1,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            11.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            11.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            11.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            11.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              280.0,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textController,
                                                                            focusNode:
                                                                                _model.textFieldFocusNode,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.textController',
                                                                              const Duration(milliseconds: 2000),
                                                                              () async {
                                                                                _model.sser = true;
                                                                                safeSetState(() {});
                                                                                safeSetState(() {
                                                                                  _model.simpleSearchResults = TextSearch(
                                                                                    listViMkanRecordList
                                                                                        .map(
                                                                                          (record) => TextSearchItem.fromTerms(record, [
                                                                                            record.naim
                                                                                          ]),
                                                                                        )
                                                                                        .toList(),
                                                                                  ).search(_model.textController.text).map((r) => r.object).toList();
                                                                                });
                                                                              },
                                                                            ),
                                                                            autofocus:
                                                                                false,
                                                                            enabled:
                                                                                true,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              isDense: true,
                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'cairo',
                                                                                    fontSize: 11.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                '6bdi3tuo' /* Looking for a teacher */,
                                                                              ),
                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'cairo',
                                                                                    fontSize: 11.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              errorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'cairo',
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            cursorColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            enableInteractiveSelection:
                                                                                true,
                                                                            validator:
                                                                                _model.textControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                        if (_model.sser ==
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.sser = false;
                                                                                safeSetState(() {});
                                                                                safeSetState(() {
                                                                                  _model.textController?.clear();
                                                                                });
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.cancel_sharp,
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      size: 11.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'vmf8goz5' /* Cancel Search */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          fontSize: 9.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if ((_model.choiceChipsValue ==
                                                            'الكل') &&
                                                        (_model.sser == false))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 0.0, 33.0),
                                                        child: StreamBuilder<
                                                            List<MkanRecord>>(
                                                          stream:
                                                              queryMkanRecord(
                                                            queryBuilder:
                                                                (mkanRecord) =>
                                                                    mkanRecord
                                                                        .where(
                                                                          'acctev',
                                                                          isEqualTo:
                                                                              true,
                                                                        )
                                                                        .where(
                                                                          'id_vill',
                                                                          isEqualTo:
                                                                              FFAppState().villa,
                                                                        ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitChasingDots(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<MkanRecord>
                                                                listViewAllMkanRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewAllMkanRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewAllIndex) {
                                                                final listViewAllMkanRecord =
                                                                    listViewAllMkanRecordList[
                                                                        listViewAllIndex];
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        270.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              8.0,
                                                                          color:
                                                                              Color(0x230F1113),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            4.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          PlacedetailsWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'mk':
                                                                                serializeParam(
                                                                              listViewAllMkanRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                            'textnaim':
                                                                                serializeParam(
                                                                              listViewAllMkanRecord.naim,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Hero(
                                                                            tag:
                                                                                valueOrDefault<String>(
                                                                              listViewAllMkanRecord.img1,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tutorial-multi-language-app-aavlbx/assets/666g545s9vh5/1077915.png'
                                                                              '$listViewAllIndex',
                                                                            ),
                                                                            transitionOnUserGestures:
                                                                                true,
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: const BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(0.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  listViewAllMkanRecord.img1,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tutorial-multi-language-app-aavlbx/assets/666g545s9vh5/1077915.png',
                                                                                ),
                                                                                width: double.infinity,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                12.0,
                                                                                16.0,
                                                                                12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        listViewAllMkanRecord.naim,
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            RatingBarIndicator(
                                                                                              itemBuilder: (context, index) => Icon(
                                                                                                Icons.radio_button_checked_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                              ),
                                                                                              direction: Axis.horizontal,
                                                                                              rating: 4.0,
                                                                                              unratedColor: FlutterFlowTheme.of(context).error,
                                                                                              itemCount: 5,
                                                                                              itemSize: 13.0,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (FFAppState().mkan.contains(listViewAllMkanRecord.reference)) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'المكان مضاف مسبقًا.',
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'cairo',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                          duration: const Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      FFAppState().addcart = FFAppState().addcart + 1;
                                                                                      FFAppState().addToCartmkss(AmaknCostmStruct(
                                                                                        naim: listViewAllMkanRecord.naim,
                                                                                        textivill: '${FFAppState().naimdolh}- ${FFAppState().naimvillatext}',
                                                                                        loceshn: listViewAllMkanRecord.location,
                                                                                        revmkan: listViewAllMkanRecord.reference,
                                                                                      ));
                                                                                      FFAppState().dataSchedule = getCurrentTimestamp;
                                                                                      FFAppState().fulltextSchedule = 'حجز فوري';
                                                                                      FFAppState().textallAlmdn = (String var1, String var2) {
                                                                                        return "$var1 $var2";
                                                                                      }(FFAppState().textallAlmdn, FFAppState().naimvillatext);
                                                                                      FFAppState().addToMkan(listViewAllMkanRecord.reference);
                                                                                      safeSetState(() {});
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'تمت إضافة : ${listViewAllMkanRecord.naim} بنجاح ',
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                          duration: const Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                          action: SnackBarAction(
                                                                                            label: 'عرض رحلتي',
                                                                                            textColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            onPressed: () async {
                                                                                              context.pushNamed(Checkout66Widget.routeName);
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 83.9,
                                                                                    height: 35.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FlutterFlowIconButton(
                                                                                            borderRadius: 8.0,
                                                                                            borderWidth: 1.0,
                                                                                            buttonSize: 31.7,
                                                                                            fillColor: FlutterFlowTheme.of(context).error,
                                                                                            icon: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              size: 12.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              if (FFAppState().mkan.contains(listViewAllMkanRecord.reference)) {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'المكان مضاف مسبقًا.',
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            fontFamily: 'cairo',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    duration: const Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                FFAppState().addcart = FFAppState().addcart + 1;
                                                                                                FFAppState().addToCartmkss(AmaknCostmStruct(
                                                                                                  naim: listViewAllMkanRecord.naim,
                                                                                                  textivill: '${FFAppState().naimdolh}- ${FFAppState().naimvillatext}',
                                                                                                  loceshn: listViewAllMkanRecord.location,
                                                                                                  revmkan: listViewAllMkanRecord.reference,
                                                                                                ));
                                                                                                FFAppState().dataSchedule = getCurrentTimestamp;
                                                                                                FFAppState().fulltextSchedule = 'حجز فوري';
                                                                                                FFAppState().textallAlmdn = (String var1, String var2) {
                                                                                                  return "$var1 $var2";
                                                                                                }(FFAppState().textallAlmdn, FFAppState().naimvillatext);
                                                                                                FFAppState().addToMkan(listViewAllMkanRecord.reference);
                                                                                                safeSetState(() {});
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'تمت إضافة : ${listViewAllMkanRecord.naim} بنجاح ',
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    duration: const Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                    action: SnackBarAction(
                                                                                                      label: 'عرض رحلتي',
                                                                                                      textColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      onPressed: () async {
                                                                                                        context.pushNamed(Checkout66Widget.routeName);
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                            },
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'y1rt0m4k' /* Add */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    fontSize: 11.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'listViewOnPageLoadAnimation2']!);
                                                          },
                                                        ),
                                                      ),
                                                    if ((_model.choiceChipsValue !=
                                                            'الكل') &&
                                                        (_model.sser == false))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 0.0, 33.0),
                                                        child: StreamBuilder<
                                                            List<MkanRecord>>(
                                                          stream:
                                                              queryMkanRecord(
                                                            queryBuilder:
                                                                (mkanRecord) =>
                                                                    mkanRecord
                                                                        .where(
                                                                          'acctev',
                                                                          isEqualTo:
                                                                              true,
                                                                        )
                                                                        .where(
                                                                          'id_vill',
                                                                          isEqualTo:
                                                                              FFAppState().villa,
                                                                        )
                                                                        .where(
                                                                          'tsnef',
                                                                          isEqualTo:
                                                                              _model.choiceChipsValue,
                                                                        ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitChasingDots(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<MkanRecord>
                                                                listViewMkanRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewMkanRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewMkanRecord =
                                                                    listViewMkanRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        270.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              8.0,
                                                                          color:
                                                                              Color(0x230F1113),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            4.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          PlacedetailsWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'mk':
                                                                                serializeParam(
                                                                              listViewMkanRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                            'textnaim':
                                                                                serializeParam(
                                                                              listViewMkanRecord.naim,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Hero(
                                                                            tag:
                                                                                valueOrDefault<String>(
                                                                              listViewMkanRecord.img1,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tutorial-multi-language-app-aavlbx/assets/666g545s9vh5/1077915.png'
                                                                              '$listViewIndex',
                                                                            ),
                                                                            transitionOnUserGestures:
                                                                                true,
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: const BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(0.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  listViewMkanRecord.img1,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tutorial-multi-language-app-aavlbx/assets/666g545s9vh5/1077915.png',
                                                                                ),
                                                                                width: double.infinity,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                12.0,
                                                                                16.0,
                                                                                12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        listViewMkanRecord.naim,
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            RatingBarIndicator(
                                                                                              itemBuilder: (context, index) => Icon(
                                                                                                Icons.radio_button_checked_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                              ),
                                                                                              direction: Axis.horizontal,
                                                                                              rating: 4.0,
                                                                                              unratedColor: FlutterFlowTheme.of(context).error,
                                                                                              itemCount: 5,
                                                                                              itemSize: 13.0,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (FFAppState().mkan.contains(listViewMkanRecord.reference)) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'المكان مضاف مسبقًا.',
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'cairo',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                          duration: const Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      FFAppState().addcart = FFAppState().addcart + 1;
                                                                                      FFAppState().addToCartmkss(AmaknCostmStruct(
                                                                                        naim: listViewMkanRecord.naim,
                                                                                        textivill: '${FFAppState().naimdolh}- ${FFAppState().naimvillatext}',
                                                                                        loceshn: listViewMkanRecord.location,
                                                                                        revmkan: listViewMkanRecord.reference,
                                                                                      ));
                                                                                      FFAppState().dataSchedule = getCurrentTimestamp;
                                                                                      FFAppState().fulltextSchedule = 'حجز فوري';
                                                                                      FFAppState().textallAlmdn = (String var1, String var2) {
                                                                                        return "$var1 $var2";
                                                                                      }(FFAppState().textallAlmdn, FFAppState().naimvillatext);
                                                                                      FFAppState().addToMkan(listViewMkanRecord.reference);
                                                                                      safeSetState(() {});
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'تمت إضافة : ${listViewMkanRecord.naim} بنجاح ',
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                          duration: const Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                          action: SnackBarAction(
                                                                                            label: 'عرض رحلتي',
                                                                                            textColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            onPressed: () async {
                                                                                              context.pushNamed(Checkout66Widget.routeName);
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 83.9,
                                                                                    height: 35.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FlutterFlowIconButton(
                                                                                            borderRadius: 8.0,
                                                                                            borderWidth: 1.0,
                                                                                            buttonSize: 31.7,
                                                                                            fillColor: FlutterFlowTheme.of(context).error,
                                                                                            icon: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              size: 12.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              FFAppState().addcart = FFAppState().addcart + 1;
                                                                                              FFAppState().addToCartmkss(AmaknCostmStruct(
                                                                                                naim: listViewMkanRecord.naim,
                                                                                                textivill: '${FFAppState().naimdolh}- ${FFAppState().naimvillatext}',
                                                                                                loceshn: listViewMkanRecord.location,
                                                                                              ));
                                                                                              FFAppState().textallAlmdn = (String var1, String var2) {
                                                                                                return "$var1 $var2";
                                                                                              }(FFAppState().textallAlmdn, FFAppState().naimvillatext);
                                                                                              safeSetState(() {});
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'تمت إضافة : ${listViewMkanRecord.naim} بنجاح ',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  duration: const Duration(milliseconds: 4000),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                  action: SnackBarAction(
                                                                                                    label: 'عرض رحلتي',
                                                                                                    textColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    onPressed: () async {
                                                                                                      context.pushNamed(Checkout66Widget.routeName);
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '3xvjxer6' /* Add */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    fontSize: 11.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'listViewOnPageLoadAnimation3']!);
                                                          },
                                                        ),
                                                      ),
                                                    if (_model.sser == true)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 0.0, 33.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final ss = _model
                                                                .simpleSearchResults
                                                                .toList();

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  ss.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      ssIndex) {
                                                                final ssItem =
                                                                    ss[ssIndex];
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        270.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              8.0,
                                                                          color:
                                                                              Color(0x230F1113),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            4.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          PlacedetailsWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'mk':
                                                                                serializeParam(
                                                                              ssItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                            'textnaim':
                                                                                serializeParam(
                                                                              ssItem.naim,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Hero(
                                                                            tag:
                                                                                ssItem.img1,
                                                                            transitionOnUserGestures:
                                                                                true,
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: const BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(0.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                              child: Image.network(
                                                                                ssItem.img1,
                                                                                width: double.infinity,
                                                                                height: 200.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                12.0,
                                                                                16.0,
                                                                                12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        ssItem.naim,
                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            RatingBarIndicator(
                                                                                              itemBuilder: (context, index) => Icon(
                                                                                                Icons.radio_button_checked_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                              ),
                                                                                              direction: Axis.horizontal,
                                                                                              rating: 4.0,
                                                                                              unratedColor: FlutterFlowTheme.of(context).error,
                                                                                              itemCount: 5,
                                                                                              itemSize: 13.0,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (FFAppState().mkan.contains(ssItem.reference)) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'المكان مضاف مسبقًا.',
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'cairo',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                          duration: const Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      FFAppState().addcart = FFAppState().addcart + 1;
                                                                                      FFAppState().addToCartmkss(AmaknCostmStruct(
                                                                                        naim: ssItem.naim,
                                                                                        textivill: '${FFAppState().naimdolh}- ${FFAppState().naimvillatext}',
                                                                                        loceshn: ssItem.location,
                                                                                        revmkan: ssItem.reference,
                                                                                      ));
                                                                                      FFAppState().dataSchedule = getCurrentTimestamp;
                                                                                      FFAppState().fulltextSchedule = 'حجز فوري';
                                                                                      FFAppState().textallAlmdn = (String var1, String var2) {
                                                                                        return "$var1 $var2";
                                                                                      }(FFAppState().textallAlmdn, FFAppState().naimvillatext);
                                                                                      FFAppState().addToMkan(ssItem.reference);
                                                                                      safeSetState(() {});
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'تمت إضافة : ${ssItem.naim} بنجاح ',
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                          duration: const Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                          action: SnackBarAction(
                                                                                            label: 'عرض رحلتي',
                                                                                            textColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            onPressed: () async {
                                                                                              context.pushNamed(Checkout66Widget.routeName);
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 83.9,
                                                                                    height: 35.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FlutterFlowIconButton(
                                                                                            borderRadius: 8.0,
                                                                                            borderWidth: 1.0,
                                                                                            buttonSize: 31.7,
                                                                                            fillColor: FlutterFlowTheme.of(context).error,
                                                                                            icon: Icon(
                                                                                              Icons.add,
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              size: 12.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              FFAppState().addcart = FFAppState().addcart + 1;
                                                                                              FFAppState().addToCartmkss(AmaknCostmStruct(
                                                                                                naim: ssItem.naim,
                                                                                                textivill: '${FFAppState().naimdolh}- ${FFAppState().naimvillatext}',
                                                                                                loceshn: ssItem.location,
                                                                                              ));
                                                                                              FFAppState().textallAlmdn = (String var1, String var2) {
                                                                                                return "$var1 $var2";
                                                                                              }(FFAppState().textallAlmdn, FFAppState().naimvillatext);
                                                                                              safeSetState(() {});
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'تمت إضافة : ${ssItem.naim} بنجاح ',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  duration: const Duration(milliseconds: 4000),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                  action: SnackBarAction(
                                                                                                    label: 'عرض رحلتي',
                                                                                                    textColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    onPressed: () async {
                                                                                                      context.pushNamed(Checkout66Widget.routeName);
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'lpknsr86' /* Add */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    fontSize: 11.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'listViewOnPageLoadAnimation4']!);
                                                          },
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
