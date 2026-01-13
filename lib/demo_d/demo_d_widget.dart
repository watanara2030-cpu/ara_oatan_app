import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'demo_d_model.dart';
export 'demo_d_model.dart';

class DemoDWidget extends StatefulWidget {
  const DemoDWidget({
    super.key,
    bool? isSpeed,
  }) : isSpeed = isSpeed ?? true;

  final bool isSpeed;

  static String routeName = 'demoD';
  static String routePath = '/BookingOption';

  @override
  State<DemoDWidget> createState() => _DemoDWidgetState();
}

class _DemoDWidgetState extends State<DemoDWidget>
    with TickerProviderStateMixin {
  late DemoDModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DemoDModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().MyserStartPay == true) {
        context.pushNamed(
          PayMoyserOKWidget.routeName,
          queryParameters: {
            'mnwebView': serializeParam(
              false,
              ParamType.bool,
            ),
          }.withoutNulls,
        );
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 460.0.ms,
            begin: const Offset(0.0, 1.0),
            end: const Offset(1.0, 1.0),
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

    return StreamBuilder<List<CitiesRecord>>(
      stream: queryCitiesRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<CitiesRecord> demoDCitiesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getText(
                  'cl0s1evg' /* Initiate  */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
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
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'phlth4za' /* What kind of tour would you li... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'cairo',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 28.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation']!),
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            if (_model.idd != 1)
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 7.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    currentUserLocationValue =
                                                        await getCurrentUserLocation(
                                                            defaultLocation:
                                                                const LatLng(
                                                                    0.0, 0.0));
                                                    _model.idd = 1;
                                                    _model.viewINFO = true;
                                                    safeSetState(() {});
                                                    _model.textTypePrent =
                                                        'اختر موقعك واضغط \"التالي\" لبدء جولتك السياحية';
                                                    safeSetState(() {});
                                                    FFAppState().typeHgz = 1;
                                                    FFAppState()
                                                            .DriverGuideState =
                                                        false;
                                                    safeSetState(() {});
                                                    FFAppState().AllowBooking =
                                                        true;
                                                    safeSetState(() {});
                                                    if (widget.isSpeed !=
                                                        false) {
                                                      FFAppState()
                                                              .IsLnstantAddress =
                                                          true;
                                                      safeSetState(() {});
                                                      // موقع الجهاز الحالي وتحديث حالة الصفحة
                                                      _model.loceshn =
                                                          currentUserLocationValue;
                                                      safeSetState(() {});
                                                      // تحويل الاحداثيات الى اعداد
                                                      FFAppState()
                                                              .LOceshtoaddAdress =
                                                          '${functions.latitudeFromLocation(_model.loceshn)},${functions.longFromLocation(_model.loceshn)}';
                                                      safeSetState(() {});
                                                      // تعيين عنوان سريع
                                                      FFAppState()
                                                              .IsLnstantAddress =
                                                          true;
                                                      safeSetState(() {});
                                                      // اتصال API
                                                      _model.apiResultvcchome2Copy3 =
                                                          await PENmdenhCall
                                                              .call(
                                                        io: FFAppState()
                                                            .LOceshtoaddAdress,
                                                      );

                                                      if ((_model
                                                              .apiResultvcchome2Copy3
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.dolh =
                                                            PENmdenhCall.dolh(
                                                          (_model.apiResultvcchome2Copy3
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        _model.mdenh =
                                                            PENmdenhCall.name(
                                                          (_model.apiResultvcchome2Copy3
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        _model.adress =
                                                            PENmdenhCall
                                                                .fullAdress(
                                                          (_model.apiResultvcchome2Copy3
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                title:
                                                                    const Text(
                                                                        'خطا'),
                                                                content: const Text(
                                                                    'لم نتمكن من العثور على موقعك الحالي ، يرجى تفعيل الموقع'),
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
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 82.7,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
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
                                                                        4.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .map_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 18.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'hd3y6hm8' /* Select My Own Tour Route */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (_model.idd == 1)
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 82.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                            child: Icon(
                                                              Icons.map_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '3um57vvt' /* Select My Own Tour Route */,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMediumIsCustom,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (_model.idd != 2)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  currentUserLocationValue =
                                                      await getCurrentUserLocation(
                                                          defaultLocation:
                                                              const LatLng(
                                                                  0.0, 0.0));
                                                  _model.idd = 2;
                                                  _model.viewINFO = true;
                                                  safeSetState(() {});
                                                  _model.textTypePrent =
                                                      'السائق سيكون مرشدك السياحي، حدّد موقعك واضغط \"التالي\"';
                                                  safeSetState(() {});
                                                  FFAppState().typeHgz = 2;
                                                  FFAppState()
                                                      .DriverGuideState = true;
                                                  safeSetState(() {});
                                                  FFAppState().AllowBooking =
                                                      true;
                                                  safeSetState(() {});
                                                  if (widget.isSpeed != false) {
                                                    FFAppState()
                                                            .IsLnstantAddress =
                                                        true;
                                                    safeSetState(() {});
                                                    // موقع الجهاز الحالي وتحديث حالة الصفحة
                                                    _model.loceshn =
                                                        currentUserLocationValue;
                                                    safeSetState(() {});
                                                    // تحويل الاحداثيات الى اعداد
                                                    FFAppState()
                                                            .LOceshtoaddAdress =
                                                        '${functions.latitudeFromLocation(_model.loceshn)},${functions.longFromLocation(_model.loceshn)}';
                                                    safeSetState(() {});
                                                    // تعيين عنوان سريع
                                                    FFAppState()
                                                            .IsLnstantAddress =
                                                        true;
                                                    safeSetState(() {});
                                                    // اتصال API
                                                    _model.apiResultvcchome2Copy4 =
                                                        await PENmdenhCall.call(
                                                      io: FFAppState()
                                                          .LOceshtoaddAdress,
                                                    );

                                                    if ((_model
                                                            .apiResultvcchome2Copy4
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.dolh =
                                                          PENmdenhCall.dolh(
                                                        (_model.apiResultvcchome2Copy4
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                      _model.mdenh =
                                                          PENmdenhCall.name(
                                                        (_model.apiResultvcchome2Copy4
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
                                                      _model.adress =
                                                          PENmdenhCall
                                                              .fullAdress(
                                                        (_model.apiResultvcchome2Copy4
                                                                ?.jsonBody ??
                                                            ''),
                                                      );
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
                                                                  'لم نتمكن من العثور على موقعك الحالي ، يرجى تفعيل الموقع'),
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
                                                  }

                                                  safeSetState(() {});
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 82.7,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .drive_eta_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'g95a9irg' /* Get Help from the Driver Guide */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (_model.idd == 2)
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 82.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .drive_eta_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'vgvwdk6i' /* Get Help from the Driver Guide */,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMediumIsCustom,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ].divide(
                                              const SizedBox(height: 20.0)),
                                        ),
                                        if (_model.idd != null)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        3.0, 0.0, 3.0, 0.0),
                                                child: Text(
                                                  _model.textTypePrent!,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 9.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (widget.isSpeed == true)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (_model.idd != null)
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '0co3jnee' /* Current Address */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'cairo',
                                                              color: const Color(
                                                                  0xFF677681),
                                                              fontSize: 11.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          _model.adress,
                                                          'يرجى تحديد موقعك الحالي..',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyLarge
                                                            .override(
                                                              fontFamily:
                                                                  'cairo',
                                                              color: const Color(
                                                                  0xFF677681),
                                                              fontSize: 11.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            currentUserLocationValue =
                                                                await getCurrentUserLocation(
                                                                    defaultLocation:
                                                                        const LatLng(
                                                                            0.0,
                                                                            0.0));
                                                            FFAppState()
                                                                    .IsLnstantAddress =
                                                                true;
                                                            safeSetState(() {});
                                                            // موقع الجهاز الحالي وتحديث حالة الصفحة
                                                            _model.loceshn =
                                                                currentUserLocationValue;
                                                            safeSetState(() {});
                                                            await _model
                                                                .googleMapsController
                                                                .future
                                                                .then(
                                                              (c) => c
                                                                  .animateCamera(
                                                                CameraUpdate
                                                                    .newLatLng(_model
                                                                        .loceshn!
                                                                        .toGoogleMaps()),
                                                              ),
                                                            );
                                                            // تحويل الاحداثيات الى اعداد
                                                            FFAppState()
                                                                    .LOceshtoaddAdress =
                                                                '${functions.latitudeFromLocation(_model.loceshn)},${functions.longFromLocation(_model.loceshn)}';
                                                            safeSetState(() {});
                                                            // تعيين عنوان سريع
                                                            FFAppState()
                                                                    .IsLnstantAddress =
                                                                true;
                                                            safeSetState(() {});
                                                            // اتصال API
                                                            _model.apiResultvcchome2Copy =
                                                                await PENmdenhCall
                                                                    .call(
                                                              io: FFAppState()
                                                                  .LOceshtoaddAdress,
                                                            );

                                                            if ((_model
                                                                    .apiResultvcchome2Copy
                                                                    ?.succeeded ??
                                                                true)) {
                                                              _model.dolh =
                                                                  PENmdenhCall
                                                                      .dolh(
                                                                (_model.apiResultvcchome2Copy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              );
                                                              _model.mdenh =
                                                                  PENmdenhCall
                                                                      .name(
                                                                (_model.apiResultvcchome2Copy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              );
                                                              _model.adress =
                                                                  PENmdenhCall
                                                                      .fullAdress(
                                                                (_model.apiResultvcchome2Copy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: const Text(
                                                                          'خطا'),
                                                                      content:
                                                                          const Text(
                                                                              'لم نتمكن من العثور على موقعك الحالي ، يرجى تفعيل الموقع'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            't5hg5lpf' /* My current location */,
                                                          ),
                                                          icon: const Icon(
                                                            Icons.location_on,
                                                            size: 11.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 35.8,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'cairo',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        if (_model.viewINFO == true)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (widget.isSpeed == false)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'xkn2qlna' /* Current Country */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'cairo',
                                                                  color: const Color(
                                                                      0xFF677681),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              FFAppState()
                                                                  .naimdolh,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'cairo',
                                                                    color: const Color(
                                                                        0xFF677681),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        title: const Text(
                                                                            'تغيير الدولة'),
                                                                        content:
                                                                            const Text('هل أنت متأكد من تغيير الدولة ؟'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                const Text('لا'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                const Text('نعم'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          FFAppState()
                                                                  .IsLnstantAddress =
                                                              false;
                                                          safeSetState(() {});

                                                          context.goNamed(
                                                              AldolWidget
                                                                  .routeName);
                                                        }
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ejl03dvi' /* Change */,
                                                      ),
                                                      icon: const Icon(
                                                        Icons.edit,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 32.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(16.0,
                                                                0.0, 16.0, 0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 0.0, 0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: const Color(
                                                                      0xFFF83B46),
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if (widget.isSpeed == true)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'wego6yn4' /* Current Country */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'cairo',
                                                                  color: const Color(
                                                                      0xFF677681),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                _model.dolh,
                                                                'يرجى تحديد موقعك الحالي..',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'cairo',
                                                                    color: const Color(
                                                                        0xFF677681),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (_model.dolh != null &&
                                                        _model.dolh != '')
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          title:
                                                                              const Text('تغيير الدولة'),
                                                                          content:
                                                                              const Text('هل أنت متأكد من تغيير الدولة ؟'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: const Text('لا'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: const Text('نعم'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            FFAppState()
                                                                    .IsLnstantAddress =
                                                                false;
                                                            safeSetState(() {});

                                                            context.goNamed(
                                                                AldolWidget
                                                                    .routeName);
                                                          }
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '08rd054d' /* Change */,
                                                        ),
                                                        icon: const Icon(
                                                          Icons.edit,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 32.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: const Color(
                                                                        0xFFF83B46),
                                                                    fontSize:
                                                                        11.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              if (widget.isSpeed == false)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'nangaxpk' /* Current City */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'cairo',
                                                                  color: const Color(
                                                                      0xFF677681),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              FFAppState()
                                                                  .naimvillatext,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'cairo',
                                                                    color: const Color(
                                                                        0xFF677681),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        title: const Text(
                                                                            'تغيير المدينة'),
                                                                        content:
                                                                            const Text('هل أنت متأكد من تغيير المدينة ؟'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                const Text('لا'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                const Text('نعم'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          FFAppState()
                                                                  .IsLnstantAddress =
                                                              false;
                                                          safeSetState(() {});

                                                          context.pushNamed(
                                                              ListWidget
                                                                  .routeName);
                                                        }
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'j5yty9t7' /* Change */,
                                                      ),
                                                      icon: const Icon(
                                                        Icons.edit,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 32.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(16.0,
                                                                0.0, 16.0, 0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 0.0, 0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: const Color(
                                                                      0xFFF83B46),
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if (widget.isSpeed == true)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '6vbaornd' /* Current City */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'cairo',
                                                                  color: const Color(
                                                                      0xFF677681),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                _model.mdenh,
                                                                'يرجى تحديد موقعك الحالي..',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'cairo',
                                                                    color: const Color(
                                                                        0xFF677681),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (_model.mdenh != null &&
                                                        _model.mdenh != '')
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          title:
                                                                              const Text('تغيير المدينة'),
                                                                          content:
                                                                              const Text('هل أنت متأكد من تغيير المدينة ؟'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: const Text('لا'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: const Text('نعم'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            FFAppState()
                                                                    .IsLnstantAddress =
                                                                false;
                                                            safeSetState(() {});
                                                            _model.villCITE =
                                                                await queryVillagesRecordOnce(
                                                              queryBuilder:
                                                                  (villagesRecord) =>
                                                                      villagesRecord
                                                                          .where(
                                                                'naim',
                                                                isEqualTo:
                                                                    _model
                                                                        .mdenh,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ).then((s) => s
                                                                    .firstOrNull);
                                                            FFAppState().mdenh =
                                                                _model.villCITE
                                                                    ?.cities;
                                                            FFAppState()
                                                                    .naimdolh =
                                                                'السعودية';
                                                            FFAppState()
                                                                    .naimmdenh =
                                                                _model.villCITE!
                                                                    .naimciteText;
                                                            safeSetState(() {});

                                                            context.pushNamed(
                                                                ListWidget
                                                                    .routeName);
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'g0is91ak' /* Change */,
                                                        ),
                                                        icon: const Icon(
                                                          Icons.edit,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 32.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: const Color(
                                                                        0xFFF83B46),
                                                                    fontSize:
                                                                        11.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                            ].divide(
                                                const SizedBox(height: 16.0)),
                                          ),
                                        if ((widget.isSpeed != false) &&
                                            (_model.viewINFO == true))
                                          Container(
                                            width: double.infinity,
                                            height: 168.4,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  '',
                                                ).image,
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 8.0,
                                                  color: Color(0xFFCACAD0),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(7.0),
                                                bottomRight:
                                                    Radius.circular(7.0),
                                                topLeft: Radius.circular(7.0),
                                                topRight: Radius.circular(7.0),
                                              ),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color: const Color(0x40000000),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Stack(
                                                children: [
                                                  const Stack(
                                                    children: [],
                                                  ),
                                                  FlutterFlowGoogleMap(
                                                    controller: _model
                                                        .googleMapsController,
                                                    onCameraIdle: (latLng) =>
                                                        _model.googleMapsCenter =
                                                            latLng,
                                                    initialLocation: _model
                                                            .googleMapsCenter ??=
                                                        _model.loceshn!,
                                                    markerColor:
                                                        GoogleMarkerColor
                                                            .violet,
                                                    mapType: MapType.hybrid,
                                                    style:
                                                        GoogleMapStyle.standard,
                                                    initialZoom: 20.0,
                                                    allowInteraction: true,
                                                    allowZoom: true,
                                                    showZoomControls: false,
                                                    showLocation: false,
                                                    showCompass: false,
                                                    showMapToolbar: false,
                                                    showTraffic: false,
                                                    centerMapOnMarkerTap: false,
                                                    mapTakesGesturePreference:
                                                        false,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: PointerInterceptor(
                                                      intercepting: isWeb,
                                                      child: Icon(
                                                        Icons.location_on,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 22.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ]
                                          .divide(const SizedBox(height: 24.0))
                                          .addToStart(
                                              const SizedBox(height: 32.0)),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 16.0)),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            if ((_model.idd != null) &&
                                (currentUserEmail == 'xs'))
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 11.0, 0.0, 11.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.41, 0.95),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          3.0, 0.0, 3.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(22.0),
                            bottomRight: Radius.circular(22.0),
                            topLeft: Radius.circular(22.0),
                            topRight: Radius.circular(22.0),
                          ),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.idd != null) {
                              await Future.wait([
                                Future(() async {
                                  if (_model.idd == 1) {
                                    FFAppState().IsLnstantAddress =
                                        widget.isSpeed;
                                    FFAppState().payth = '';
                                    FFAppState().fulltextSchedule = '';
                                    FFAppState().totalKM = 0.0;
                                    FFAppState().cartmkss = [];
                                    FFAppState().addcart = 0;
                                    FFAppState().mkan = [];
                                    FFAppState().update(() {});

                                    context.pushNamed(
                                      ListViWidget.routeName,
                                      queryParameters: {
                                        'cite': serializeParam(
                                          FFAppState().villa,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );

                                    triggerPushNotification(
                                      notificationTitle: 'السلام',
                                      notificationText: 'مرحبا',
                                      notificationSound: 'default',
                                      userRefs: [currentUserReference!],
                                      initialPageName: 'List',
                                      parameterData: {},
                                    );
                                  }
                                }),
                                Future(() async {
                                  if (_model.idd == 2) {
                                    context
                                        .pushNamed(Checkout66Widget.routeName);

                                    FFAppState().IsLnstantAddress =
                                        widget.isSpeed;
                                    FFAppState().payth = '';
                                    FFAppState().fulltextSchedule = '';
                                    FFAppState().cartmkss = [];
                                    FFAppState().addcart = 0;
                                    FFAppState().mkan = [];
                                    FFAppState().update(() {});
                                  }
                                }),
                                Future(() async {
                                  if (widget.isSpeed) {
                                    // Vill مدن
                                    _model.mdenhVill =
                                        await queryVillagesRecordOnce(
                                      queryBuilder: (villagesRecord) =>
                                          villagesRecord.where(
                                        'naim',
                                        isEqualTo: _model.mdenh,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    // دول
                                    _model.dol = await queryCountriesRecordOnce(
                                      queryBuilder: (countriesRecord) =>
                                          countriesRecord.where(
                                        'naim',
                                        isEqualTo: _model.dolh,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    FFAppState().dolh = _model.dol?.reference;
                                    FFAppState().naimdolh = _model.dol!.naim;
                                    FFAppState().villnow = null;
                                    FFAppState().villtextnow = '';
                                    FFAppState().addcart = 0;
                                    FFAppState().cartmkss = [];
                                    FFAppState().cartPriceSummary = [];
                                    FFAppState().saatcar = 0;
                                    FFAppState().totalsaatandcar = 0;
                                    FFAppState().srtypecar = 0;
                                    FFAppState().typecarRev = null;
                                    FFAppState().tebycar = '';
                                    FFAppState().notcar = '';
                                    FFAppState().imgDolh = _model.dol!.img;
                                    FFAppState().msegAi = '';
                                    FFAppState().textallAlmdn = '';
                                    FFAppState().totalApp = 0.0;
                                    FFAppState().TOTALmndob = 0.0;
                                    FFAppState().vat = 0.0;
                                    FFAppState().totalAllNew = 0.0;
                                    FFAppState().VatDolh = _model.dol!.vat;
                                    FFAppState().isVat = _model.dol!.isvat;
                                    FFAppState().RMZCurrency =
                                        _model.dol!.currencySymbol;
                                    FFAppState().totalapp2 = 0;
                                    FFAppState().totalAllNow2 = 0;
                                    FFAppState().vat2 = 0;
                                    FFAppState().TOTALmndob2 = 0;
                                    FFAppState().fulltextSchedule = '';
                                    FFAppState().Minimumhours = 0;
                                    FFAppState().mkan = [];
                                    FFAppState().update(() {});
                                    FFAppState().villa = null;
                                    FFAppState().latlngvill =
                                        _model.mdenhVill?.latLing;
                                    safeSetState(() {});
                                    FFAppState().villa =
                                        _model.mdenhVill?.reference;
                                    FFAppState().mdenh =
                                        _model.mdenhVill?.cities;
                                    FFAppState().vil =
                                        _model.mdenhVill?.reference;
                                    FFAppState().naimmdenh =
                                        _model.mdenhVill!.naimciteText;
                                    FFAppState().naimvillatext =
                                        _model.mdenhVill!.naim;
                                    FFAppState().dolh = _model.dol?.reference;
                                    FFAppState().naimdolh = _model.dol!.naim;
                                    FFAppState().AdressTelet = _model.mdenh!;
                                    FFAppState().fullAdress = _model.adress!;
                                    FFAppState().villnow =
                                        _model.mdenhVill?.reference;
                                    FFAppState().villtextnow =
                                        _model.mdenhVill!.naim;
                                    FFAppState().payth = '';
                                    FFAppState().vat =
                                        _model.dol!.vat.toDouble();
                                    FFAppState().isVat = _model.dol!.isvat;
                                    FFAppState().RMZCurrency =
                                        FFAppState().RMZCurrency;
                                    FFAppState().VatDolh = _model.dol!.vat;
                                    FFAppState().mkanuserorder =
                                        _model.googleMapsCenter;
                                    FFAppState().akrLoceshn =
                                        FFAppState().mkanuserorder;
                                    FFAppState().update(() {});
                                  }
                                }),
                              ]);
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: const Text('خطا'),
                                      content: const Text(
                                          'يرجى تحديد نوع الجولة المطلوبة او / الموقع '),
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

                            safeSetState(() {});
                          },
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'eokg9a9c' /* Next */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
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
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      9.0, 0.0, 9.0, 0.0),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
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
        );
      },
    );
  }
}
