import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'aldol_model.dart';
export 'aldol_model.dart';

class AldolWidget extends StatefulWidget {
  const AldolWidget({super.key});

  static String routeName = 'aldol';
  static String routePath = '/aldol';

  @override
  State<AldolWidget> createState() => _AldolWidgetState();
}

class _AldolWidgetState extends State<AldolWidget>
    with TickerProviderStateMixin {
  late AldolModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AldolModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 40.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation': AnimationInfo(
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
      'textOnPageLoadAnimation2': AnimationInfo(
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
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
          title: Text(
            FFLocalizations.of(context).getText(
              'p6fpp7ky' /* Welcome to Ara Watan */,
            ),
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                  color: FlutterFlowTheme.of(context).info,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).labelLargeIsCustom,
                ),
          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<List<CountriesRecord>>(
                stream: queryCountriesRecord(
                  queryBuilder: (countriesRecord) => countriesRecord.where(
                    'saudi',
                    isEqualTo: true,
                  ),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitChasingDots(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<CountriesRecord> containerCountriesRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final containerCountriesRecord =
                      containerCountriesRecordList.isNotEmpty
                          ? containerCountriesRecordList.first
                          : null;

                  return Container(
                    width: double.infinity,
                    height: 171.24,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 224.12,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              'https://images.unsplash.com/photo-1590523741831-ab7e8b8f9c7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVhY2hlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                            ).image,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x250F1113),
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: 100.0,
                          height: 0.0,
                          decoration: BoxDecoration(
                            color: const Color(0x430F1113),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                containerCountriesRecord!.img,
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '2xe4zfms' /* The first international Saudi ... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            shadows: [
                                              Shadow(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                offset: const Offset(2.0, 2.0),
                                                blurRadius: 2.0,
                                              ),
                                              Shadow(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                offset: const Offset(2.0, 2.0),
                                                blurRadius: 2.0,
                                              )
                                            ],
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation1']!),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 55.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().dolh =
                                                containerCountriesRecord
                                                    .reference;
                                            FFAppState().naimdolh =
                                                containerCountriesRecord.naim;
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
                                            FFAppState().imgDolh =
                                                containerCountriesRecord.img;
                                            FFAppState().msegAi = '';
                                            FFAppState().textallAlmdn = '';
                                            FFAppState().totalApp = 0.0;
                                            FFAppState().TOTALmndob = 0.0;
                                            FFAppState().vat = 0.0;
                                            FFAppState().totalAllNew = 0.0;
                                            FFAppState().VatDolh =
                                                containerCountriesRecord.vat;
                                            FFAppState().isVat =
                                                containerCountriesRecord.isvat;
                                            FFAppState().RMZCurrency =
                                                containerCountriesRecord
                                                    .currencySymbol;
                                            FFAppState().totalapp2 = 0;
                                            FFAppState().totalAllNow2 = 0;
                                            FFAppState().vat2 = 0;
                                            FFAppState().TOTALmndob2 = 0;
                                            safeSetState(() {});

                                            context.pushNamed(
                                              Citie2Widget.routeName,
                                              queryParameters: {
                                                'coun': serializeParam(
                                                  containerCountriesRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'naim': serializeParam(
                                                  containerCountriesRecord.naim,
                                                  ParamType.String,
                                                ),
                                                'osfdolh': serializeParam(
                                                  containerCountriesRecord.osf,
                                                  ParamType.String,
                                                ),
                                                'imgDolh': serializeParam(
                                                  containerCountriesRecord.img,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'xiyj484n' /* Browse Saudi Arabia */,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 44.0,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallIsCustom,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        )
                                            .animateOnPageLoad(animationsMap[
                                                'buttonOnPageLoadAnimation']!)
                                            .animateOnActionTrigger(
                                              animationsMap[
                                                  'buttonOnActionTriggerAnimation']!,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                    ),
                  );
                },
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 18.0, 24.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'bzjdrejy' /* Other countries */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelMediumFamily,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                      ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 44.0),
                child: StreamBuilder<List<CountriesRecord>>(
                  stream: queryCountriesRecord(
                    queryBuilder: (countriesRecord) => countriesRecord
                        .where(
                          'acctev',
                          isEqualTo: true,
                        )
                        .where(
                          'saudi',
                          isEqualTo: false,
                        )
                        .orderBy('num_trteb'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitChasingDots(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<CountriesRecord> listViewCountriesRecordList =
                        snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewCountriesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewCountriesRecord =
                            listViewCountriesRecordList[listViewIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 8.0),
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x32000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(26.0),
                                    child: Image.network(
                                      listViewCountriesRecord.img,
                                      width: 36.0,
                                      height: 36.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                              enText: listViewCountriesRecord
                                                  .naimEnglesh,
                                              arText:
                                                  listViewCountriesRecord.naim,
                                              zh_HansText:
                                                  listViewCountriesRecord
                                                      .naimEnglesh,
                                              trText: listViewCountriesRecord
                                                  .naimEnglesh,
                                              urText: listViewCountriesRecord
                                                  .naimEnglesh,
                                              ruText: listViewCountriesRecord
                                                  .naimEnglesh,
                                              azText: listViewCountriesRecord
                                                  .naimEnglesh,
                                              kaText: listViewCountriesRecord
                                                  .naimEnglesh,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().dolh =
                                          listViewCountriesRecord.reference;
                                      FFAppState().naimdolh =
                                          listViewCountriesRecord.naim;
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
                                      FFAppState().imgDolh =
                                          listViewCountriesRecord.img;
                                      FFAppState().textallAlmdn = '';
                                      FFAppState().msegAi = '';
                                      FFAppState().TOTALmndob = 0.0;
                                      FFAppState().totalApp = 0.0;
                                      FFAppState().vat = 0.0;
                                      FFAppState().totalAllNew = 0.0;
                                      FFAppState().VatDolh =
                                          valueOrDefault<int>(
                                        listViewCountriesRecord.vat,
                                        0,
                                      );
                                      FFAppState().isVat =
                                          listViewCountriesRecord.isvat;
                                      FFAppState().RMZCurrency =
                                          listViewCountriesRecord
                                              .currencySymbol;
                                      safeSetState(() {});

                                      context.pushNamed(
                                        Citie2Widget.routeName,
                                        queryParameters: {
                                          'coun': serializeParam(
                                            listViewCountriesRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'naim': serializeParam(
                                            listViewCountriesRecord.naim,
                                            ParamType.String,
                                          ),
                                          'osfdolh': serializeParam(
                                            listViewCountriesRecord.osf,
                                            ParamType.String,
                                          ),
                                          'idcit': serializeParam(
                                            listViewCountriesRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'imgDolh': serializeParam(
                                            listViewCountriesRecord.img,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'hym6nejh' /* browse */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 70.0,
                                      height: 36.0,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelMediumIsCustom,
                                          ),
                                      elevation: 2.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ).animateOnPageLoad(
                        animationsMap['listViewOnPageLoadAnimation']!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
