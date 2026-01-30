import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/mmaapp_widget.dart';
import '/components/payment_methods2_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'checkout66_model.dart';
export 'checkout66_model.dart';

/// ملاحظة: لايمكن إتمام طلبك حتى يتم إضافة رقم الجوال ( إضافة رقم الجوال)
class Checkout66Widget extends StatefulWidget {
  const Checkout66Widget({super.key});

  static String routeName = 'Checkout66';
  static String routePath = '/checkout66';

  @override
  State<Checkout66Widget> createState() => _Checkout66WidgetState();
}

class _Checkout66WidgetState extends State<Checkout66Widget>
    with TickerProviderStateMixin {
  late Checkout66Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Checkout66Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().DriverGuideState == false) {
        FFAppState().aiRow = false;
        FFAppState().Minimumhours = (FFAppState().addcart / 2).toInt();
        safeSetState(() {});
        if (FFAppState().Minimumhours >= 2) {
          FFAppState().Minimumhours = FFAppState().Minimumhours;
          safeSetState(() {});
        } else {
          FFAppState().Minimumhours = 0;
          safeSetState(() {});
        }
      } else {
        FFAppState().Minimumhours = 0;
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController(
        text: (FFAppState().saatcar + FFAppState().addhors).toString());
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 460.0.ms,
            begin: const Offset(0.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
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
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(22.0),
                      bottomRight: Radius.circular(22.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'mq4294hr' /* YOU ARE BROWSING NOW */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                            Text(
                              FFAppState().naimdolh,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w100,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelSmallIsCustom,
                                  ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 11.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          LISTCountriesWidget.routeName);
                                    },
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vuz463hm' /* Change country */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 18.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(LISTCountriesWidget.routeName);
                            },
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
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'yy1tb3mw' /* You are currently browsing. */,
                                ),
                                textAlign: TextAlign.center,
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
                              subtitle: Text(
                                FFAppState().naimvillatext,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelMediumIsCustom,
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              dense: false,
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
                                  Icons.map,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 25.0,
                                ),
                                title: Text(
                                  FFAppState().naimmdenh,
                                  textAlign: TextAlign.start,
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
                                subtitle: Text(
                                  FFLocalizations.of(context).getText(
                                    'n46e0sg0' /* Go now. */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                      .secondaryText,
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
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                    'oqt82ju4' /* Added destinations */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                      .secondaryText,
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
                                  List22TaskOverviewResponsiveWidget.routeName);
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
                                    'v6yf1odi' /* My bookings */,
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
                                subtitle: Text(
                                  FFLocalizations.of(context).getText(
                                    'kx4lgrt5' /* Booking list. */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                      .secondaryText,
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
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: Icon(
                                Icons.mail_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 25.0,
                              ),
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'r4vmp44e' /* 0 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
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
                                  'g3vg9g5t' /* رسائل جديدة */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelMediumIsCustom,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              dense: false,
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
                                    'y62g7p0k' /* Settings */,
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
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.list_alt,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              if (FFAppState().typeHgz == 1) {
                context.pushNamed(
                  ListViWidget.routeName,
                  queryParameters: {
                    'cite': serializeParam(
                      FFAppState().villa,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              } else {
                context.pushNamed(DemoDWidget.routeName);
              }
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'q0xxfq1y' /* My trip list */,
            ),
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 18.0.sp,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).labelLargeIsCustom,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (currentPhoneNumber == '')
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Container(
                          height: 103.24.h,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).error,
                            borderRadius: BorderRadius.circular(8.0.r),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.0.r),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.warning_amber_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 18.0.sp,
                                    ),
                                    Text(
                                      FFLocalizations.of(context)
                                          .getText('2n28fqm2'),
                                      textAlign: TextAlign.center,
                                      overflow:
                                          TextOverflow.ellipsis, // ✅ Add ...
                                      softWrap: true, // ✅ Allow wrapping
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                            fontSize: 9.sp, // ✅ Make it smaller
                                          ),
                                    )
                                  ].divide(const SizedBox(width: 0.0)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                          UpdateProfWidget.routeName);
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'vlo7yf10' /* Add your phone number */,
                                    ),
                                    icon: const Icon(
                                      Icons.add_outlined,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 32.5,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleSmallIsCustom,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (FFAppState().addcart >= 1)
                      FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const MmaappWidget(),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: FFLocalizations.of(context).getText(
                          'k3s4rdw2' /* View my trip list map */,
                        ),
                        icon: const Icon(
                          Icons.map_outlined,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconColor: FlutterFlowTheme.of(context).primary,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleSmallIsCustom,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                  ],
                ),
              ),
              if (FFAppState().AllowBooking == true)
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 9.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(ListCarWidget.routeName);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.directions_car,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        title: Text(
                          valueOrDefault<String>(
                            FFAppState().tebycar,
                            'لم يتم تحديد سيارة',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelLargeIsCustom,
                              ),
                        ),
                        subtitle: Text(
                          valueOrDefault<String>(
                            FFAppState().notcar,
                            ' السيارة المفضلة',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelMediumIsCustom,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(11.0),
                            bottomRight: Radius.circular(11.0),
                            topLeft: Radius.circular(11.0),
                            topRight: Radius.circular(11.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if ((FFAppState().AllowBooking == true) &&
                  (FFAppState().IsLnstantAddress == false))
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 9.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(ListAdressSelectWidget.routeName);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.location_pin,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        title: Text(
                          valueOrDefault<String>(
                            FFAppState().villtextnow,
                            'مكان الإلتقاء',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelLargeIsCustom,
                              ),
                        ),
                        subtitle: Text(
                          valueOrDefault<String>(
                            FFAppState().adressNaim,
                            'يجب إختيار مكان الإلتقاء ',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelMediumIsCustom,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(11.0),
                            bottomRight: Radius.circular(11.0),
                            topLeft: Radius.circular(11.0),
                            topRight: Radius.circular(11.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if ((FFAppState().AllowBooking == true) &&
                  (FFAppState().IsLnstantAddress == true))
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 9.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      currentUserLocationValue = await getCurrentUserLocation(
                          defaultLocation: const LatLng(0.0, 0.0));
                      // تاكيد تحديث الموقع
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: const Text('تحديث الموقع'),
                                  content: const Text(
                                      'هل أنت متأكد من تحديث موقعك الحالي؟'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: const Text('لا'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: const Text('نعم'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        // تحويل الاحداثيات الى اعداد
                        FFAppState().LOceshtoaddAdress =
                            '${functions.latitudeFromLocation(currentUserLocationValue)},${functions.longFromLocation(currentUserLocationValue)}';
                        safeSetState(() {});
                        // تعيين عنوان سريع
                        FFAppState().IsLnstantAddress = true;
                        safeSetState(() {});
                        // اتصال API لتحديد الموقع الحالي للمستخدم
                        _model.apiResultvcchome2Copy33 =
                            await PENmdenhCall.call(
                          io: FFAppState().LOceshtoaddAdress,
                        );

                        if ((_model.apiResultvcchome2Copy33?.succeeded ??
                            true)) {
                          // تحديث حالة التطبيق موقع المستخدم الحالي
                          FFAppState().mkanuserorder = currentUserLocationValue;
                          FFAppState().fullAdress = PENmdenhCall.fullAdress(
                            (_model.apiResultvcchome2Copy33?.jsonBody ?? ''),
                          )!;
                          FFAppState().adressNaim = PENmdenhCall.name(
                            (_model.apiResultvcchome2Copy33?.jsonBody ?? ''),
                          )!;
                          safeSetState(() {});
                          // جلب المدينة من Villages
                          _model.vil = await queryVillagesRecordOnce(
                            queryBuilder: (villagesRecord) =>
                                villagesRecord.where(
                              'naim',
                              isEqualTo: PENmdenhCall.name(
                                (_model.apiResultvcchome2Copy33?.jsonBody ??
                                    ''),
                              ),
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          // تعيين متغيرات التطبيق الضرورية
                          FFAppState().villa = _model.vil?.reference;
                          FFAppState().villnow = _model.vil?.reference;
                          FFAppState().villtextnow = PENmdenhCall.name(
                            (_model.apiResultvcchome2Copy33?.jsonBody ?? ''),
                          )!;
                          safeSetState(() {});
                        } else {
                          // إشعار خطا
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: const Text('خطا'),
                                  content: const Text(
                                      'لم نتمكن من العثور على موقعك الحالي ، يرجى تفعيل الموقع'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      }

                      safeSetState(() {});
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.location_pin,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        title: Text(
                          valueOrDefault<String>(
                            FFAppState().villtextnow,
                            'مكان الإلتقاء',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelLargeIsCustom,
                              ),
                        ),
                        subtitle: Text(
                          FFAppState().fullAdress,
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelMediumIsCustom,
                              ),
                        ),
                        trailing: Icon(
                          Icons.settings_backup_restore,
                          color: FlutterFlowTheme.of(context).error,
                          size: 20.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(11.0),
                            bottomRight: Radius.circular(11.0),
                            topLeft: Radius.circular(11.0),
                            topRight: Radius.circular(11.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (FFAppState().AllowBooking == true)
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 9.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final datePickedDate = await showDatePicker(
                        context: context,
                        initialDate: getCurrentTimestamp,
                        firstDate: getCurrentTimestamp,
                        lastDate: DateTime(2050),
                        builder: (context, child) {
                          return wrapInMaterialDatePickerTheme(
                            context,
                            child!,
                            headerBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            headerForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            headerTextStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'cairo',
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            pickerBackgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            pickerForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            selectedDateTimeBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            selectedDateTimeForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            actionButtonForegroundColor:
                                FlutterFlowTheme.of(context).error,
                            iconSize: 24.0,
                          );
                        },
                      );

                      TimeOfDay? datePickedTime;
                      if (datePickedDate != null) {
                        datePickedTime = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                          builder: (context, child) {
                            return wrapInMaterialTimePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'cairo',
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).error,
                              iconSize: 24.0,
                            );
                          },
                        );
                      }

                      if (datePickedDate != null && datePickedTime != null) {
                        safeSetState(() {
                          _model.datePicked = DateTime(
                            datePickedDate.year,
                            datePickedDate.month,
                            datePickedDate.day,
                            datePickedTime!.hour,
                            datePickedTime.minute,
                          );
                        });
                      } else if (_model.datePicked != null) {
                        safeSetState(() {
                          _model.datePicked = getCurrentTimestamp;
                        });
                      }
                      if (_model.datePicked != null) {
                        FFAppState().dataSchedule = _model.datePicked;
                        FFAppState().fulltextSchedule =
                            _model.datePicked!.toString();
                        safeSetState(() {});
                      }
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.schedule_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        title: Text(
                          FFLocalizations.of(context).getText(
                            '04e2w4m3' /* Trip scheduling */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelLargeIsCustom,
                              ),
                        ),
                        subtitle: Text(
                          valueOrDefault<String>(
                            FFAppState().fulltextSchedule,
                            'اختياريا، يمكنك اختيار تاريخ ووقت بدء الرحلة',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelMediumIsCustom,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(11.0),
                            bottomRight: Radius.circular(11.0),
                            topLeft: Radius.circular(11.0),
                            topRight: Radius.circular(11.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (FFAppState().AllowBooking == true)
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 9.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.77,
                                  child: const PaymentMethods2Widget(),
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.payment_sharp,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        title: Text(
                          FFLocalizations.of(context).getText(
                            '97gi9omv' /* Payment method. */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelLargeIsCustom,
                              ),
                        ),
                        subtitle: Text(
                          valueOrDefault<String>(
                            FFAppState().payth,
                            'حدد طريقة الدفع',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelMediumIsCustom,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(11.0),
                            bottomRight: Radius.circular(11.0),
                            topLeft: Radius.circular(11.0),
                            topRight: Radius.circular(11.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if ((FFAppState().villnow != null) &&
                  (FFAppState().typecarRev != null))
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(7.0, 8.0, 7.0, 8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'xwem2m5v' /* Need extra hours? */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .headlineSmallIsCustom,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '1zxsuzzb' /* Planning for a longer trip? Ad... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                          if (FFAppState().Minimumhours >= 2)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              4.0, 0.0, 4.0, 0.0),
                                      child: Icon(
                                        Icons.sim_card_alert,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 9.0,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText:
                                            'Based on the defined iterations, the minimum hours required are ${FFAppState().Minimumhours.toString()} hours ',
                                        arText:
                                            'بناءً على الجولات التي تم تحديدها، فإن الحدّ الأدنى للساعات هو${FFAppState().Minimumhours.toString()} ساعة',
                                        zh_HansText:
                                            'Based on the defined iterations, the minimum hours required are ${FFAppState().Minimumhours.toString()} hours ',
                                        trText:
                                            'Based on the defined iterations, the minimum hours required are ${FFAppState().Minimumhours.toString()} hours ',
                                        urText:
                                            'Based on the defined iterations, the minimum hours required are ${FFAppState().Minimumhours.toString()} hours ',
                                        ruText:
                                            'Based on the defined iterations, the minimum hours required are ${FFAppState().Minimumhours.toString()} hours ',
                                        azText:
                                            'Based on the defined iterations, the minimum hours required are ${FFAppState().Minimumhours.toString()} hours ',
                                        kaText:
                                            'Based on the defined iterations, the minimum hours required are ${FFAppState().Minimumhours.toString()} hours ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation']!),
                                  ],
                                ),
                              ],
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '3wz9h8sg' /* Current Hours */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodySmallIsCustom,
                                        ),
                                  ),
                                  Text(
                                    '${FFAppState().saatcar.toString()} ساعة  ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyLargeIsCustom,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            22.0, 0.0, 22.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '2c08i4up' /* Additional Hours? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodySmallIsCustom,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 120.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              Icon(
                                            Icons.remove_rounded,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 18.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              Icon(
                                            Icons.add_rounded,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 18.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  shadows: [
                                                    Shadow(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      offset: const Offset(
                                                          2.0, 2.0),
                                                      blurRadius: 2.0,
                                                    )
                                                  ],
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeIsCustom,
                                                ),
                                          ),
                                          count: _model.countControllerValue ??=
                                              0,
                                          updateCount: (count) async {
                                            safeSetState(() => _model
                                                    .countControllerValue =
                                                count); // تحديث حالة التطبيق
                                            FFAppState().totalKsm2 = _model
                                                    .countControllerValue!
                                                    .toDouble() *
                                                FFAppState()
                                                    .srtypecar
                                                    .toDouble() *
                                                FFAppState().NsbhKsm /
                                                100;
                                            safeSetState(() {});
                                            if (FFAppState().totalKsm2 <
                                                FFAppState().UbKsm.toDouble()) {
                                              // تحديث الساعات
                                              FFAppState().addhors =
                                                  _model.countControllerValue!;
                                              FFAppState().totalsaat =
                                                  FFAppState().saatcar +
                                                      FFAppState().addhors;
                                              FFAppState().totalAllNew = 0.0;
                                              FFAppState().totalAllnowPrent =
                                                  '';
                                              FFAppState().TOTALmndob2 = 0;
                                              FFAppState().totalapp2 = 0;
                                              FFAppState().vat2 = 0;
                                              FFAppState().totalAllNow2 = 0;
                                              FFAppState().totalKsm2 = 0.0;
                                              safeSetState(() {});
                                              // خصم متغير
                                              FFAppState().totalKsm2 = _model
                                                      .countControllerValue!
                                                      .toDouble() *
                                                  FFAppState()
                                                      .srtypecar
                                                      .toDouble() *
                                                  FFAppState().NsbhKsm /
                                                  100;
                                              safeSetState(() {});
                                              // إجراء عملية محاسبية ( حدف القيم السابقة
                                              FFAppState().TOTALmndob2 = 0;
                                              FFAppState().totalapp2 = 0;
                                              FFAppState().vat2 = 0;
                                              FFAppState().totalAllNow2 = 0;
                                              FFAppState().update(() {});
                                              // تعيين قيم جديدة محاسبية
                                              FFAppState().TOTALmndob2 =
                                                  functions.total(
                                                      FFAppState().srtypecar,
                                                      FFAppState()
                                                          .totalsaat
                                                          .toDouble())!;
                                              FFAppState().totalapp2 =
                                                  functions.vat(
                                                      15.0,
                                                      functions.total(
                                                          FFAppState()
                                                              .srtypecar,
                                                          FFAppState()
                                                              .totalsaat
                                                              .toDouble()))!;
                                              FFAppState().vat2 = functions.vat(
                                                  FFAppState()
                                                      .VatDolh
                                                      .toDouble(),
                                                  functions.total(
                                                      FFAppState().srtypecar,
                                                      FFAppState()
                                                          .totalsaat
                                                          .toDouble()))!;
                                              FFAppState().totalAllNow2 =
                                                  FFAppState().TOTALmndob2 +
                                                      FFAppState().totalapp2 +
                                                      FFAppState().vat2;
                                              FFAppState().totalmndob3 =
                                                  functions
                                                      .total(
                                                          FFAppState()
                                                              .srtypecar,
                                                          FFAppState()
                                                              .totalsaat
                                                              .toDouble())!
                                                      .toDouble();
                                              FFAppState().update(() {});
                                              // تحديث الحسابات متغير حالة التطبيق
                                              FFAppState().TOTALmndob2 =
                                                  FFAppState().TOTALmndob2 -
                                                      FFAppState().totalapp2 -
                                                      FFAppState().vat2;
                                              FFAppState().totalAllNow2 =
                                                  FFAppState().TOTALmndob2 +
                                                      FFAppState().totalapp2 +
                                                      FFAppState().vat2;
                                              FFAppState().totalmndob3 =
                                                  FFAppState().totalmndob3 -
                                                      FFAppState().totalapp2 -
                                                      FFAppState().vat2 -
                                                      FFAppState().totalKsm2;
                                              FFAppState().totalAllnow3 =
                                                  FFAppState().totalmndob3 +
                                                      FFAppState().totalapp2 +
                                                      FFAppState().vat2 -
                                                      FFAppState().totalKsm2;
                                              FFAppState().update(() {});
                                              FFAppState().TOTALmndob2 =
                                                  functions.total(
                                                      FFAppState().srtypecar,
                                                      FFAppState()
                                                          .totalsaat
                                                          .toDouble())!;
                                              FFAppState().totalapp2 =
                                                  functions.vat(
                                                      15.0,
                                                      functions.total(
                                                          FFAppState()
                                                              .srtypecar,
                                                          FFAppState()
                                                              .totalsaat
                                                              .toDouble()))!;
                                              FFAppState().vat2 = functions.vat(
                                                  FFAppState()
                                                      .VatDolh
                                                      .toDouble(),
                                                  functions.total(
                                                      FFAppState().srtypecar,
                                                      FFAppState()
                                                          .totalsaat
                                                          .toDouble()))!;
                                              FFAppState().totalAllNow2 =
                                                  FFAppState().TOTALmndob2 +
                                                      FFAppState().totalapp2 +
                                                      FFAppState().vat2;
                                              FFAppState().update(() {});
                                              FFAppState().totalmndob3 =
                                                  functions
                                                      .total(
                                                          FFAppState()
                                                              .srtypecar,
                                                          FFAppState()
                                                              .totalsaat
                                                              .toDouble())!
                                                      .toDouble();
                                              FFAppState().totalAllnow3 =
                                                  (FFAppState().TOTALmndob2 +
                                                          FFAppState()
                                                              .totalapp2 +
                                                          FFAppState().vat2)
                                                      .toDouble();
                                              safeSetState(() {});
                                              FFAppState().totalmndob3 =
                                                  FFAppState().totalmndob3 -
                                                      FFAppState()
                                                          .totalapp2
                                                          .toDouble() -
                                                      FFAppState()
                                                          .vat2
                                                          .toDouble();
                                              FFAppState().totalAllnow3 =
                                                  FFAppState().totalmndob3 +
                                                      FFAppState()
                                                          .totalapp2
                                                          .toDouble() +
                                                      FFAppState()
                                                          .vat2
                                                          .toDouble() -
                                                      FFAppState().totalKsm2;
                                              safeSetState(() {});
                                            } else {
                                              FFAppState().addhors =
                                                  _model.countControllerValue!;
                                              FFAppState().totalsaat =
                                                  FFAppState().saatcar +
                                                      FFAppState().addhors;
                                              FFAppState().totalAllNew = 0.0;
                                              FFAppState().totalAllnowPrent =
                                                  '';
                                              FFAppState().TOTALmndob2 = 0;
                                              FFAppState().totalapp2 = 0;
                                              FFAppState().vat2 = 0;
                                              FFAppState().totalAllNow2 = 0;
                                              FFAppState().totalKsm2 = 0.0;
                                              safeSetState(() {});
                                              // خصم ثابت
                                              FFAppState().totalKsm2 =
                                                  FFAppState().UbKsm.toDouble();
                                              safeSetState(() {});
                                              FFAppState().TOTALmndob2 = 0;
                                              FFAppState().totalapp2 = 0;
                                              FFAppState().vat2 = 0;
                                              FFAppState().totalAllNow2 = 0;
                                              FFAppState().update(() {});
                                              FFAppState().TOTALmndob2 =
                                                  functions.total(
                                                      FFAppState().srtypecar,
                                                      FFAppState()
                                                          .totalsaat
                                                          .toDouble())!;
                                              FFAppState().totalapp2 =
                                                  functions.vat(
                                                      15.0,
                                                      functions.total(
                                                          FFAppState()
                                                              .srtypecar,
                                                          FFAppState()
                                                              .totalsaat
                                                              .toDouble()))!;
                                              FFAppState().vat2 = functions.vat(
                                                  FFAppState()
                                                      .VatDolh
                                                      .toDouble(),
                                                  functions.total(
                                                      FFAppState().srtypecar,
                                                      FFAppState()
                                                          .totalsaat
                                                          .toDouble()))!;
                                              FFAppState().totalAllNow2 =
                                                  FFAppState().TOTALmndob2 +
                                                      FFAppState().totalapp2 +
                                                      FFAppState().vat2;
                                              FFAppState().totalmndob3 =
                                                  functions
                                                      .total(
                                                          FFAppState()
                                                              .srtypecar,
                                                          FFAppState()
                                                              .totalsaat
                                                              .toDouble())!
                                                      .toDouble();
                                              FFAppState().update(() {});
                                              FFAppState().TOTALmndob2 =
                                                  FFAppState().TOTALmndob2 -
                                                      FFAppState().totalapp2 -
                                                      FFAppState().vat2;
                                              FFAppState().totalAllNow2 =
                                                  FFAppState().TOTALmndob2 +
                                                      FFAppState().totalapp2 +
                                                      FFAppState().vat2;
                                              FFAppState().totalmndob3 =
                                                  FFAppState().totalmndob3 -
                                                      FFAppState().totalapp2 -
                                                      FFAppState().vat2 -
                                                      FFAppState().totalKsm2;
                                              FFAppState().totalAllnow3 =
                                                  FFAppState().totalmndob3 +
                                                      FFAppState().totalapp2 +
                                                      FFAppState().vat2 -
                                                      FFAppState().totalKsm2;
                                              FFAppState().update(() {});
                                              FFAppState().TOTALmndob2 =
                                                  functions.total(
                                                      FFAppState().srtypecar,
                                                      FFAppState()
                                                          .totalsaat
                                                          .toDouble())!;
                                              FFAppState().totalapp2 =
                                                  functions.vat(
                                                      15.0,
                                                      functions.total(
                                                          FFAppState()
                                                              .srtypecar,
                                                          FFAppState()
                                                              .totalsaat
                                                              .toDouble()))!;
                                              FFAppState().vat2 = functions.vat(
                                                  FFAppState()
                                                      .VatDolh
                                                      .toDouble(),
                                                  functions.total(
                                                      FFAppState().srtypecar,
                                                      FFAppState()
                                                          .totalsaat
                                                          .toDouble()))!;
                                              FFAppState().totalAllNow2 =
                                                  FFAppState().TOTALmndob2 +
                                                      FFAppState().totalapp2 +
                                                      FFAppState().vat2;
                                              FFAppState().update(() {});
                                              FFAppState().totalmndob3 =
                                                  functions
                                                      .total(
                                                          FFAppState()
                                                              .srtypecar,
                                                          FFAppState()
                                                              .totalsaat
                                                              .toDouble())!
                                                      .toDouble();
                                              FFAppState().totalAllnow3 =
                                                  (FFAppState().TOTALmndob2 +
                                                          FFAppState()
                                                              .totalapp2 +
                                                          FFAppState().vat2)
                                                      .toDouble();
                                              safeSetState(() {});
                                              FFAppState().totalmndob3 =
                                                  FFAppState().totalmndob3 -
                                                      FFAppState()
                                                          .totalapp2
                                                          .toDouble() -
                                                      FFAppState()
                                                          .vat2
                                                          .toDouble();
                                              FFAppState().totalAllnow3 =
                                                  FFAppState().totalmndob3 +
                                                      FFAppState()
                                                          .totalapp2
                                                          .toDouble() +
                                                      FFAppState()
                                                          .vat2
                                                          .toDouble() -
                                                      FFAppState().totalKsm2;
                                              safeSetState(() {});
                                            }
                                          },
                                          stepSize: 1,
                                          minimum: 0,
                                          maximum: 300,
                                          contentPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                          if (FFAppState().NsbhKsm >= 1.0)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      Icons.local_offer,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 10.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Text(
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'You get a  ${formatNumber(
                                        FFAppState().NsbhKsm,
                                        formatType: FormatType.percent,
                                      )}  discount for each additional hour you add, up to a maximum of  ${FFAppState().UbKsm.toString()}${FFAppState().RMZCurrency}',
                                      arText:
                                          'تحصل على خصم ${FFAppState().NsbhKsm.toString()} % لكل ساعة إضافية تضيفها، بحد أقصى ${FFAppState().UbKsm.toString()}${FFAppState().RMZCurrency}',
                                      zh_HansText: 'You get a  ${formatNumber(
                                        FFAppState().NsbhKsm,
                                        formatType: FormatType.percent,
                                      )}  discount for each additional hour you add, up to a maximum of  ${FFAppState().UbKsm.toString()}${FFAppState().RMZCurrency}',
                                      trText: 'You get a  ${formatNumber(
                                        FFAppState().NsbhKsm,
                                        formatType: FormatType.percent,
                                      )}  discount for each additional hour you add, up to a maximum of  ${FFAppState().UbKsm.toString()}${FFAppState().RMZCurrency}',
                                      urText: 'You get a  ${formatNumber(
                                        FFAppState().NsbhKsm,
                                        formatType: FormatType.percent,
                                      )}  discount for each additional hour you add, up to a maximum of  ${FFAppState().UbKsm.toString()}${FFAppState().RMZCurrency}',
                                      ruText: 'You get a  ${formatNumber(
                                        FFAppState().NsbhKsm,
                                        formatType: FormatType.percent,
                                      )}  discount for each additional hour you add, up to a maximum of  ${FFAppState().UbKsm.toString()}${FFAppState().RMZCurrency}',
                                      azText: 'You get a  ${formatNumber(
                                        FFAppState().NsbhKsm,
                                        formatType: FormatType.percent,
                                      )}  discount for each additional hour you add, up to a maximum of  ${FFAppState().UbKsm.toString()}${FFAppState().RMZCurrency}',
                                      kaText: 'You get a  ${formatNumber(
                                        FFAppState().NsbhKsm,
                                        formatType: FormatType.percent,
                                      )}  discount for each additional hour you add, up to a maximum of  ${FFAppState().UbKsm.toString()}${FFAppState().RMZCurrency}',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation1']!),
                ),
              if (FFAppState().addcart >= 1)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 10.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '3im46sag' /* List of added locations. */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                        ),
                  ),
                ),
              if ((FFAppState().addcart <= 0) && (FFAppState().typeHgz == 1))
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 22.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 33.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.sentiment_dissatisfied,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 33.0,
                                  ),
                                ),
                                if (FFAppState().addcart <= 0)
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 33.0, 18.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vbjndb7s' /* No tours have been added! */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              if (FFAppState().typeHgz == 2)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        height: 77.84,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(44.0),
                            topRight: Radius.circular(44.0),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 12),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 33.0, 0.0, 0.0),
                              child: Icon(
                                Icons.drive_eta_sharp,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 22.0,
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (FFAppState().addcart <= 0)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 11.0, 18.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context)
                                        .getText('un9qx6mz'),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              if (FFAppState().typeHgz == 1)
                Builder(
                  builder: (context) {
                    final mkss = FFAppState().cartmkss.toList();

                    return SingleChildScrollView(
                      child: Column(
                        children: List.generate(mkss.length, (mkssIndex) {
                          final mkssItem = mkss[mkssIndex];
                          return ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              mkssItem.naim,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLargeIsCustom,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              mkssItem.textivill,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLargeIsCustom,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.delete_outline_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        FFAppState()
                                            .removeFromCartmkss(mkssItem);
                                        FFAppState().addcart =
                                            FFAppState().addcart + -1;
                                        FFAppState().Minimumhours =
                                            (FFAppState().addcart / 2).toInt();
                                        FFAppState()
                                            .removeFromMkan(mkssItem.revmkan!);
                                        FFAppState().update(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    );
                  },
                ),
              if (FFAppState().addcart >= 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if ((valueOrDefault<bool>(
                                currentUserDocument?.actevMndob, false) ==
                            true) &&
                        (currentUserUid == '00900'))
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 19.0, 0.0, 11.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => SizedBox(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: FFLocalizations.of(context).getText(
                                  'njvlci0g' /* عدد الساعات المطلوبة */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelMediumIsCustom,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'lxw2tgd1' /* TextField */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelMediumIsCustom,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              keyboardType: TextInputType.number,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    if ((FFAppState().villnow != null) &&
                        (FFAppState().typecarRev != null))
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            3.0, 0.0, 3.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'uo4b66pm' /*  Price Summary */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .headlineSmallIsCustom,
                                      ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ar2wbkyv' /* Total Booking Hours: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        '${FFAppState().totalsaat.toString()} ساعات',
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '0oiiec0x' /* Driver Fee: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                    Text(
                                      '${FFAppState().totalmndob3.toString()}${FFAppState().RMZCurrency}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'dwq00wue' /* App Fee  (15%): */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                    Text(
                                      '${FFAppState().totalapp2.toString()}${FFAppState().RMZCurrency}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                                if (FFAppState().isVat == true)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'VAT  ضريبة القيمة المضافة  ${FFAppState().VatDolh.toString()}% :',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      Text(
                                        '${FFAppState().vat2.toString()}${FFAppState().RMZCurrency}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ],
                                  ),
                                if ((FFAppState().addhors >= 1) &&
                                    (FFAppState().NsbhKsm >= 1.0))
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'fy9yp6wj' /* Total Deductions: */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      Text(
                                        '${FFAppState().totalKsm2.toString()} ${FFAppState().RMZCurrency}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ],
                                  ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'jdq5i83p' /* Total Amount: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .headlineSmallIsCustom,
                                          ),
                                    ),
                                    Text(
                                      '${FFAppState().totalAllnow3.toString()}${FFAppState().RMZCurrency}',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .headlineSmallIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                                if ((FFAppState().payth != 'نقدآ') &&
                                    (FFAppState().payth != ''))
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 7.0, 0.0, 22.0),
                                    child: Row(
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if ((FFAppState().Minimumhours >=
                                                    2) &&
                                                (FFAppState().totalsaat <
                                                    FFAppState()
                                                        .Minimumhours)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'بناءً على الجولات التي تم تحديدها، فإن الحدّ الأدنى للساعات هو  ${FFAppState().Minimumhours.toString()} ساعات',
                                                    style: TextStyle(
                                                      fontFamily: 'cairo',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                            } else {
                                              _model.apiResultr5n =
                                                  await MyserCall.call(
                                                description:
                                                    '$currentUserDisplayName/ حجز رحلة  ${FFAppState().totalsaat.toString()} ساعات - ${FFAppState().naimvillatext}',
                                                amount:
                                                    (FFAppState().totalAllnow3 *
                                                            100)
                                                        .round(),
                                                name:
                                                    FFAppState().CardData.name,
                                                number: FFAppState()
                                                    .CardData
                                                    .number,
                                                month:
                                                    FFAppState().CardData.month,
                                                year:
                                                    FFAppState().CardData.year,
                                                cvc: FFAppState().CardData.cvc,
                                              );

                                              if ((_model.apiResultr5n
                                                      ?.succeeded ??
                                                  true)) {
                                                FFAppState().PayMyserid =
                                                    MyserCall.id(
                                                  (_model.apiResultr5n
                                                          ?.jsonBody ??
                                                      ''),
                                                )!;
                                                FFAppState().MyserStartPay =
                                                    true;
                                                FFAppState().DonePay = false;
                                                FFAppState().TypeHgzPAYMOYSER =
                                                    TypeHgz.Rhlh;
                                                FFAppState().update(() {});

                                                context.pushNamed(
                                                  WebviewWidget.routeName,
                                                  queryParameters: {
                                                    'url': serializeParam(
                                                      MyserCall.url(
                                                        (_model.apiResultr5n
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'خطا في معلومات الدفع او البطاقة',
                                                      style: TextStyle(
                                                        fontFamily: 'cairo',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                );
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'hgw4quay' /* Pay Now */,
                                          ),
                                          icon: const Icon(
                                            Icons.payment_outlined,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.92,
                                            height: 53.0,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'cairo',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if ((valueOrDefault(
                                                currentUserDocument?.phoneN, 0)
                                            .toString() !=
                                        '') &&
                                    (FFAppState().payth == 'نقدآ') &&
                                    (FFAppState().DriverGuideState == true))
                                  AuthUserStreamWidget(
                                    builder: (context) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 64.1,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Visibility(
                                            visible: (valueOrDefault(
                                                            currentUserDocument
                                                                ?.phoneN,
                                                            0)
                                                        .toString() !=
                                                    '') &&
                                                (FFAppState().payth == 'نقدآ'),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await Future.wait([
                                                  Future(() async {
                                                    if ((FFAppState().tebycar !=
                                                            '') &&
                                                        (FFAppState()
                                                                .mkanuserorder !=
                                                            null)) {
                                                      _model.conOrder =
                                                          await queryOrderRecordCount();
                                                      _model.ngl =
                                                          await querySettingsRecordOnce(
                                                        queryBuilder:
                                                            (settingsRecord) =>
                                                                settingsRecord
                                                                    .where(
                                                          'id',
                                                          isNotEqualTo: 1,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      if (FFAppState()
                                                              .DriverGuideState ==
                                                          true) {
                                                        await OrderRecord
                                                            .collection
                                                            .doc()
                                                            .set({
                                                          ...createOrderRecordData(
                                                            total: FFAppState()
                                                                .totalAllnow3,
                                                            user:
                                                                currentUserReference,
                                                            lokeshn: FFAppState()
                                                                .mkanuserorder,
                                                            dataOrder:
                                                                getCurrentTimestamp,
                                                            cartext:
                                                                FFAppState()
                                                                    .tebycar,
                                                            carRev: FFAppState()
                                                                .typecarRev,
                                                            naimUserText:
                                                                currentUserDisplayName,
                                                            phoneNumper:
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.phoneN,
                                                                    0),
                                                            addCartNumer:
                                                                FFAppState()
                                                                    .addcart,
                                                            villText:
                                                                FFAppState()
                                                                    .villtextnow,
                                                            citiesUserNow:
                                                                FFAppState()
                                                                    .villnow,
                                                            totalTaim:
                                                                FFAppState()
                                                                    .totalsaat,
                                                            vill: FFAppState()
                                                                .villnow,
                                                            iDorder:
                                                                ((_model.conOrder!) +
                                                                        1)
                                                                    .toString(),
                                                            halhOrder:
                                                                Halh.Pending,
                                                            schedule: FFAppState()
                                                                .dataSchedule,
                                                            fullSchedule:
                                                                FFAppState()
                                                                    .fulltextSchedule,
                                                            halhText:
                                                                'بإنتظار قبول المندوب',
                                                            totalApp:
                                                                FFAppState()
                                                                    .totalapp2,
                                                            totalVat:
                                                                FFAppState()
                                                                    .vat2,
                                                            halh:
                                                                'بإنتظار قبول المندوب',
                                                            imgProfileClent:
                                                                currentUserPhoto,
                                                            loceshStreng:
                                                                FFAppState()
                                                                    .mkanuserorder
                                                                    ?.toString(),
                                                            allnow: true,
                                                            activeOrder: false,
                                                            totalMndob2:
                                                                FFAppState()
                                                                    .totalmndob3,
                                                            ksm: FFAppState()
                                                                .totalKsm2,
                                                            driverGuide: true,
                                                            reviewMndonsend:
                                                                false,
                                                            retengUser:
                                                                valueOrDefault<
                                                                    double>(
                                                              functions
                                                                  .averageRating(
                                                                      (currentUserDocument?.reteng.toList() ??
                                                                              [])
                                                                          .toList())
                                                                  ?.toDouble(),
                                                              0.0,
                                                            ),
                                                            srSAAH: FFAppState()
                                                                .srtypecar
                                                                .toDouble(),
                                                            paymentMethod:
                                                                PaymentMethod
                                                                    .Cash,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'listAmakn':
                                                                  getAmaknCostmListFirestoreData(
                                                                FFAppState()
                                                                    .cartmkss,
                                                              ),
                                                            },
                                                          ),
                                                        });
                                                      } else {
                                                        await OrderRecord
                                                            .collection
                                                            .doc()
                                                            .set({
                                                          ...createOrderRecordData(
                                                            total: FFAppState()
                                                                .totalAllnow3,
                                                            user:
                                                                currentUserReference,
                                                            lokeshn: FFAppState()
                                                                .mkanuserorder,
                                                            dataOrder:
                                                                getCurrentTimestamp,
                                                            cartext:
                                                                FFAppState()
                                                                    .tebycar,
                                                            carRev: FFAppState()
                                                                .typecarRev,
                                                            naimUserText:
                                                                currentUserDisplayName,
                                                            phoneNumper:
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.phoneN,
                                                                    0),
                                                            addCartNumer:
                                                                FFAppState()
                                                                    .addcart,
                                                            villText:
                                                                FFAppState()
                                                                    .villtextnow,
                                                            citiesUserNow:
                                                                FFAppState()
                                                                    .villnow,
                                                            totalTaim:
                                                                FFAppState()
                                                                    .totalsaat,
                                                            vill: FFAppState()
                                                                .villnow,
                                                            iDorder:
                                                                ((_model.conOrder!) +
                                                                        1)
                                                                    .toString(),
                                                            halhOrder:
                                                                Halh.Pending,
                                                            schedule: FFAppState()
                                                                .dataSchedule,
                                                            fullSchedule:
                                                                FFAppState()
                                                                    .fulltextSchedule,
                                                            halhText:
                                                                'بإنتظار قبول المندوب',
                                                            totalApp:
                                                                FFAppState()
                                                                    .totalapp2,
                                                            totalVat:
                                                                FFAppState()
                                                                    .vat2,
                                                            halh:
                                                                'بإنتظار قبول المندوب',
                                                            imgProfileClent:
                                                                currentUserPhoto,
                                                            loceshStreng:
                                                                FFAppState()
                                                                    .mkanuserorder
                                                                    ?.toString(),
                                                            allnow: true,
                                                            activeOrder: false,
                                                            totalMndob2:
                                                                FFAppState()
                                                                    .totalmndob3,
                                                            ksm: FFAppState()
                                                                .totalKsm2,
                                                            driverGuide: false,
                                                            reviewMndonsend:
                                                                false,
                                                            srSAAH: FFAppState()
                                                                .srtypecar
                                                                .toDouble(),
                                                            paymentMethod:
                                                                PaymentMethod
                                                                    .Cash,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'listAmakn':
                                                                  getAmaknCostmListFirestoreData(
                                                                FFAppState()
                                                                    .cartmkss,
                                                              ),
                                                            },
                                                          ),
                                                        });
                                                      }

                                                      _model.mnadebList =
                                                          await queryUserRecordOnce(
                                                        queryBuilder:
                                                            (userRecord) =>
                                                                userRecord
                                                                    .where(
                                                                      'mndob_vill',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .villnow,
                                                                    )
                                                                    .where(
                                                                      'actev_mndob',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'ismndom',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'ismndob',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'mndob_type_car',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .typecarRev,
                                                                    )
                                                                    .where(
                                                                      'ngl',
                                                                      isEqualTo:
                                                                          _model
                                                                              .ngl
                                                                              ?.ngl,
                                                                    ),
                                                      );
                                                      _model.mnadebListcon =
                                                          await queryUserRecordCount(
                                                        queryBuilder:
                                                            (userRecord) =>
                                                                userRecord
                                                                    .where(
                                                                      'mndob_vill',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .villnow,
                                                                    )
                                                                    .where(
                                                                      'actev_mndob',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'ismndom',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'ismndob',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'mndob_type_car',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .typecarRev,
                                                                    )
                                                                    .where(
                                                                      'ngl',
                                                                      isEqualTo:
                                                                          _model
                                                                              .ngl
                                                                              ?.ngl,
                                                                    ),
                                                      );
                                                      _model.nmndob =
                                                          _model.mnadebListcon;
                                                      safeSetState(() {});
                                                      // مسح الخصومات
                                                      FFAppState().typeHgz = 0;
                                                      FFAppState()
                                                          .AllowBooking = false;
                                                      FFAppState()
                                                              .DriverGuideState =
                                                          false;
                                                      FFAppState().NsbhKsm =
                                                          0.0;
                                                      FFAppState().totalKsm = 0;
                                                      FFAppState().UbKsm = 0;
                                                      FFAppState().totalKsm2 =
                                                          0.0;
                                                      FFAppState()
                                                          .totalAllnow3 = 0.0;
                                                      safeSetState(() {});

                                                      context.pushNamed(
                                                          OksendWidget
                                                              .routeName);

                                                      FFAppState().typecarRev =
                                                          null;
                                                      FFAppState().addcart = 0;
                                                      FFAppState().cartItems =
                                                          [];
                                                      FFAppState().cartmkss =
                                                          [];
                                                      FFAppState()
                                                          .cartPriceSummary = [];
                                                      FFAppState().saatcar = 0;
                                                      FFAppState()
                                                          .totalsaatandcar = 0;
                                                      FFAppState().srtypecar =
                                                          0;
                                                      FFAppState().tebycar = '';
                                                      FFAppState().notcar = '';
                                                      FFAppState().adressNaim =
                                                          '';
                                                      FFAppState()
                                                              .adressSelection =
                                                          null;
                                                      FFAppState()
                                                          .fulltextSchedule = '';
                                                      FFAppState()
                                                          .taimSchedule = '';
                                                      FFAppState().TOTALmndob2 =
                                                          0;
                                                      FFAppState().totalapp2 =
                                                          0;
                                                      FFAppState().vat2 = 0;
                                                      FFAppState()
                                                          .totalAllNow2 = 0;
                                                      safeSetState(() {});
                                                      for (int loop1Index = 0;
                                                          loop1Index <=
                                                              _model.mnadebList!
                                                                  .length;
                                                          loop1Index++) {
                                                        final currentLoop1Item =
                                                            _model.mnadebList!
                                                                    .map((e) => e)
                                                                    .toList()[
                                                                loop1Index];
                                                        if (_model.nmndob ==
                                                            0) {
                                                          break;
                                                        } else {
                                                          _model.apiResultdy8 =
                                                              await WatcCall
                                                                  .call(
                                                            to: currentLoop1Item
                                                                .phoneNumber,
                                                            msg:
                                                                'السلام عليكم أ/ ${currentLoop1Item.displayName}نفيدكم بوجود طلب جديد في تطبيق \"توري تاكسي\" لمدة *${FFAppState().totalsaat.toString()}ساعات  *مع عائد مالي قدره *${FFAppState().totalmndob3.toString()}${FFAppState().RMZCurrency}*                    نرجو منكم التكرم بقبول الطلب من خلال الدخول إلى التطبيق في أقرب وقت ممكن.مع خالص التحية والتقدير،\"                              فريق دعم تطبيق \"توري تاكسي( هذه الرسالة تمت بشكل ألي من خلال التطبيق (يمكنك الدخول الى تطبيق المندوب',
                                                          );

                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                'طلب جديد',
                                                            notificationText:
                                                                'نفيدكم بوجود طلب جديد في تطبيق \"توري تاكسي\" لمدة *${FFAppState().totalsaat.toString()}ساعات  *مع عائد مالي قدره *${FFAppState().totalmndob3.toString()}${FFAppState().RMZCurrency}*                    نرجو منكم التكرم بقبول الطلب من خلال الدخول إلى التطبيق في أقرب وقت ممكن.مع خالص التحية والتقدير،\"',
                                                            userRefs: [
                                                              currentLoop1Item
                                                                  .reference
                                                            ],
                                                            initialPageName:
                                                                'List',
                                                            parameterData: {},
                                                          );
                                                          _model.nmndob =
                                                              (_model.nmndob!) -
                                                                  1;
                                                          safeSetState(() {});
                                                        }
                                                      }
                                                      FFAppState().totalmndob3 =
                                                          0.0;
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: const Text(
                                                                  'خطا'),
                                                              content: const Text(
                                                                  'يرجى تحديد كل الخيارات'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child:
                                                                      const Text(
                                                                          'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                  }),
                                                  Future(() async {}),
                                                ]);

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '4pp7yghj' /* Book now */,
                                              ),
                                              icon: const Icon(
                                                Icons.send,
                                                size: 22.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 25.3,
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if ((valueOrDefault(
                                                currentUserDocument?.phoneN, 0)
                                            .toString() !=
                                        '') &&
                                    (FFAppState().payth == 'نقدآ') &&
                                    (FFAppState().DriverGuideState == false))
                                  AuthUserStreamWidget(
                                    builder: (context) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 64.1,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Visibility(
                                            visible: (valueOrDefault(
                                                            currentUserDocument
                                                                ?.phoneN,
                                                            0)
                                                        .toString() !=
                                                    '') &&
                                                (FFAppState().payth == 'نقدآ'),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await Future.wait([
                                                  Future(() async {
                                                    if ((FFAppState().tebycar !=
                                                            '') &&
                                                        (FFAppState()
                                                                .mkanuserorder !=
                                                            null) &&
                                                        (FFAppState()
                                                                .totalsaat >=
                                                            FFAppState()
                                                                .Minimumhours)) {
                                                      _model.conOrder2 =
                                                          await queryOrderRecordCount();
                                                      _model.ngl2 =
                                                          await querySettingsRecordOnce(
                                                        queryBuilder:
                                                            (settingsRecord) =>
                                                                settingsRecord
                                                                    .where(
                                                          'id',
                                                          isNotEqualTo: 1,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      if (FFAppState()
                                                              .DriverGuideState ==
                                                          true) {
                                                        await OrderRecord
                                                            .collection
                                                            .doc()
                                                            .set({
                                                          ...createOrderRecordData(
                                                            total: FFAppState()
                                                                .totalAllnow3,
                                                            user:
                                                                currentUserReference,
                                                            lokeshn: FFAppState()
                                                                .mkanuserorder,
                                                            dataOrder:
                                                                getCurrentTimestamp,
                                                            cartext:
                                                                FFAppState()
                                                                    .tebycar,
                                                            carRev: FFAppState()
                                                                .typecarRev,
                                                            naimUserText:
                                                                currentUserDisplayName,
                                                            phoneNumper:
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.phoneN,
                                                                    0),
                                                            addCartNumer:
                                                                FFAppState()
                                                                    .addcart,
                                                            villText:
                                                                FFAppState()
                                                                    .villtextnow,
                                                            citiesUserNow:
                                                                FFAppState()
                                                                    .villnow,
                                                            totalTaim:
                                                                FFAppState()
                                                                    .totalsaat,
                                                            vill: FFAppState()
                                                                .villnow,
                                                            iDorder:
                                                                ((_model.conOrder!) +
                                                                        1)
                                                                    .toString(),
                                                            halhOrder:
                                                                Halh.Pending,
                                                            schedule: FFAppState()
                                                                .dataSchedule,
                                                            fullSchedule:
                                                                FFAppState()
                                                                    .fulltextSchedule,
                                                            halhText:
                                                                'بإنتظار قبول المندوب',
                                                            totalApp:
                                                                FFAppState()
                                                                    .totalapp2,
                                                            totalVat:
                                                                FFAppState()
                                                                    .vat2,
                                                            halh:
                                                                'بإنتظار قبول المندوب',
                                                            imgProfileClent:
                                                                currentUserPhoto,
                                                            loceshStreng:
                                                                FFAppState()
                                                                    .mkanuserorder
                                                                    ?.toString(),
                                                            allnow: true,
                                                            activeOrder: false,
                                                            totalMndob2:
                                                                FFAppState()
                                                                    .totalmndob3,
                                                            ksm: FFAppState()
                                                                .totalKsm2,
                                                            driverGuide: true,
                                                            reviewMndonsend:
                                                                false,
                                                            retengUser:
                                                                valueOrDefault<
                                                                    double>(
                                                              functions
                                                                  .averageRating(
                                                                      (currentUserDocument?.reteng.toList() ??
                                                                              [])
                                                                          .toList())
                                                                  ?.toDouble(),
                                                              0.0,
                                                            ),
                                                            srSAAH: FFAppState()
                                                                .srtypecar
                                                                .toDouble(),
                                                            paymentMethod:
                                                                PaymentMethod
                                                                    .Cash,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'listAmakn':
                                                                  getAmaknCostmListFirestoreData(
                                                                FFAppState()
                                                                    .cartmkss,
                                                              ),
                                                            },
                                                          ),
                                                        });
                                                      } else {
                                                        await OrderRecord
                                                            .collection
                                                            .doc()
                                                            .set({
                                                          ...createOrderRecordData(
                                                            total: FFAppState()
                                                                .totalAllnow3,
                                                            user:
                                                                currentUserReference,
                                                            lokeshn: FFAppState()
                                                                .mkanuserorder,
                                                            dataOrder:
                                                                getCurrentTimestamp,
                                                            cartext:
                                                                FFAppState()
                                                                    .tebycar,
                                                            carRev: FFAppState()
                                                                .typecarRev,
                                                            naimUserText:
                                                                currentUserDisplayName,
                                                            phoneNumper:
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.phoneN,
                                                                    0),
                                                            addCartNumer:
                                                                FFAppState()
                                                                    .addcart,
                                                            villText:
                                                                FFAppState()
                                                                    .villtextnow,
                                                            citiesUserNow:
                                                                FFAppState()
                                                                    .villnow,
                                                            totalTaim:
                                                                FFAppState()
                                                                    .totalsaat,
                                                            vill: FFAppState()
                                                                .villnow,
                                                            iDorder:
                                                                ((_model.conOrder2!) +
                                                                        1)
                                                                    .toString(),
                                                            halhOrder:
                                                                Halh.Pending,
                                                            schedule: FFAppState()
                                                                .dataSchedule,
                                                            fullSchedule:
                                                                FFAppState()
                                                                    .fulltextSchedule,
                                                            halhText:
                                                                'بإنتظار قبول المندوب',
                                                            totalApp:
                                                                FFAppState()
                                                                    .totalapp2,
                                                            totalVat:
                                                                FFAppState()
                                                                    .vat2,
                                                            halh:
                                                                'بإنتظار قبول المندوب',
                                                            imgProfileClent:
                                                                currentUserPhoto,
                                                            loceshStreng:
                                                                FFAppState()
                                                                    .mkanuserorder
                                                                    ?.toString(),
                                                            allnow: true,
                                                            activeOrder: false,
                                                            totalMndob2:
                                                                FFAppState()
                                                                    .totalmndob3,
                                                            ksm: FFAppState()
                                                                .totalKsm2,
                                                            driverGuide: false,
                                                            reviewMndonsend:
                                                                false,
                                                            srSAAH: FFAppState()
                                                                .srtypecar
                                                                .toDouble(),
                                                            paymentMethod:
                                                                PaymentMethod
                                                                    .Cash,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'listAmakn':
                                                                  getAmaknCostmListFirestoreData(
                                                                FFAppState()
                                                                    .cartmkss,
                                                              ),
                                                            },
                                                          ),
                                                        });
                                                      }

                                                      _model.mnadebList2 =
                                                          await queryUserRecordOnce(
                                                        queryBuilder:
                                                            (userRecord) =>
                                                                userRecord
                                                                    .where(
                                                                      'mndob_vill',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .villnow,
                                                                    )
                                                                    .where(
                                                                      'actev_mndob',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'ismndom',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'ismndob',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'mndob_type_car',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .typecarRev,
                                                                    )
                                                                    .where(
                                                                      'ngl',
                                                                      isEqualTo: _model
                                                                          .ngl2
                                                                          ?.ngl,
                                                                    ),
                                                      );
                                                      _model.mnadebListcon2 =
                                                          await queryUserRecordCount(
                                                        queryBuilder:
                                                            (userRecord) =>
                                                                userRecord
                                                                    .where(
                                                                      'mndob_vill',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .villnow,
                                                                    )
                                                                    .where(
                                                                      'actev_mndob',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'ismndom',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'ismndob',
                                                                      isEqualTo:
                                                                          true,
                                                                    )
                                                                    .where(
                                                                      'mndob_type_car',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .typecarRev,
                                                                    )
                                                                    .where(
                                                                      'ngl',
                                                                      isEqualTo: _model
                                                                          .ngl2
                                                                          ?.ngl,
                                                                    ),
                                                      );
                                                      _model.nmndob =
                                                          _model.mnadebListcon2;
                                                      safeSetState(() {});
                                                      // مسح الخصومات
                                                      FFAppState().typeHgz = 0;
                                                      FFAppState()
                                                          .AllowBooking = false;
                                                      FFAppState()
                                                              .DriverGuideState =
                                                          false;
                                                      FFAppState().NsbhKsm =
                                                          0.0;
                                                      FFAppState().totalKsm = 0;
                                                      FFAppState().UbKsm = 0;
                                                      FFAppState().totalKsm2 =
                                                          0.0;
                                                      FFAppState()
                                                          .totalAllnow3 = 0.0;
                                                      safeSetState(() {});

                                                      context.pushNamed(
                                                          OksendWidget
                                                              .routeName);

                                                      FFAppState().typecarRev =
                                                          null;
                                                      FFAppState().addcart = 0;
                                                      FFAppState().cartItems =
                                                          [];
                                                      FFAppState().cartmkss =
                                                          [];
                                                      FFAppState()
                                                          .cartPriceSummary = [];
                                                      FFAppState().saatcar = 0;
                                                      FFAppState()
                                                          .totalsaatandcar = 0;
                                                      FFAppState().srtypecar =
                                                          0;
                                                      FFAppState().tebycar = '';
                                                      FFAppState().notcar = '';
                                                      FFAppState().adressNaim =
                                                          '';
                                                      FFAppState()
                                                              .adressSelection =
                                                          null;
                                                      FFAppState()
                                                          .fulltextSchedule = '';
                                                      FFAppState()
                                                          .taimSchedule = '';
                                                      FFAppState().TOTALmndob2 =
                                                          0;
                                                      FFAppState().totalapp2 =
                                                          0;
                                                      FFAppState().vat2 = 0;
                                                      FFAppState()
                                                          .totalAllNow2 = 0;
                                                      safeSetState(() {});
                                                      FFAppState().totalmndob3 =
                                                          0.0;
                                                      safeSetState(() {});
                                                      for (int loop1Index = 0;
                                                          loop1Index <=
                                                              _model
                                                                  .mnadebList2!
                                                                  .length;
                                                          loop1Index++) {
                                                        final currentLoop1Item =
                                                            _model.mnadebList2!
                                                                    .map((e) => e)
                                                                    .toList()[
                                                                loop1Index];
                                                        if (_model.nmndob ==
                                                            0) {
                                                          break;
                                                        } else {
                                                          _model.apiResultdy88 =
                                                              await WatcCall
                                                                  .call(
                                                            to: currentLoop1Item
                                                                .phoneNumber,
                                                            msg:
                                                                'السلام عليكم أ/ ${currentLoop1Item.displayName}نفيدكم بوجود طلب جديد في تطبيق \"توري تاكسي\" لمدة *${FFAppState().totalsaat.toString()}ساعات  *مع عائد مالي قدره *${FFAppState().totalmndob3.toString()}${FFAppState().RMZCurrency}*                    نرجو منكم التكرم بقبول الطلب من خلال الدخول إلى التطبيق في أقرب وقت ممكن.مع خالص التحية والتقدير،\"                              فريق دعم تطبيق \"توري تاكسي( هذه الرسالة تمت بشكل ألي من خلال التطبيق (يمكنك الدخول الى تطبيق المندوب',
                                                          );

                                                          _model.nmndob =
                                                              (_model.nmndob!) -
                                                                  1;
                                                          safeSetState(() {});
                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                'طلب جديد',
                                                            notificationText:
                                                                'نفيدكم بوجود طلب جديد في تطبيق \"توري تاكسي\" لمدة *${FFAppState().totalsaat.toString()}ساعات  *مع عائد مالي قدره *${FFAppState().totalmndob3.toString()}${FFAppState().RMZCurrency}*                    نرجو منكم التكرم بقبول الطلب من خلال الدخول إلى التطبيق في أقرب وقت ممكن.مع خالص التحية والتقدير،\"',
                                                            userRefs: [
                                                              currentLoop1Item
                                                                  .reference
                                                            ],
                                                            initialPageName:
                                                                'List',
                                                            parameterData: {},
                                                          );
                                                        }
                                                      }
                                                      FFAppState().totalmndob3 =
                                                          0.0;
                                                      safeSetState(() {});
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              enText:
                                                                  'Please select all options or add extra hours to match the trip requirements.',
                                                              arText:
                                                                  'يرجى استكمال الخيارات أو زيادة الساعات الإضافية لتتوافق مع الرحلة.',
                                                              zh_HansText:
                                                                  'Please select all options or add extra hours to match the trip requirements.',
                                                              trText:
                                                                  'Please select all options or add extra hours to match the trip requirements.',
                                                              urText:
                                                                  'Please select all options or add extra hours to match the trip requirements.',
                                                              ruText:
                                                                  'Please select all options or add extra hours to match the trip requirements.',
                                                              azText:
                                                                  'Please select all options or add extra hours to match the trip requirements.',
                                                              kaText:
                                                                  'Please select all options or add extra hours to match the trip requirements.',
                                                            ),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'cairo',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    }
                                                  }),
                                                  Future(() async {}),
                                                ]);

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '6o9re56s' /* Book now */,
                                              ),
                                              icon: const Icon(
                                                Icons.send,
                                                size: 22.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 25.3,
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ].divide(const SizedBox(height: 12.0)),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
