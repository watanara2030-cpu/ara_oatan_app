import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'pay_moyser_o_k_model.dart';
export 'pay_moyser_o_k_model.dart';

class PayMoyserOKWidget extends StatefulWidget {
  const PayMoyserOKWidget({
    super.key,
    this.mnwebView,
  });

  final bool? mnwebView;

  static String routeName = 'payMoyserOK';
  static String routePath = '/payMoyserOK';

  @override
  State<PayMoyserOKWidget> createState() => _PayMoyserOKWidgetState();
}

class _PayMoyserOKWidgetState extends State<PayMoyserOKWidget>
    with TickerProviderStateMixin {
  late PayMoyserOKModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PayMoyserOKModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().MyserStartPay = false;
      safeSetState(() {});
      if (widget.mnwebView == false) {
        _model.apiResult5yz = await MyserGetCall.call(
          id: FFAppState().PayMyserid,
        );

        if ((_model.apiResult5yz?.succeeded ?? true)) {
          if (MyserGetCall.halh(
                (_model.apiResult5yz?.jsonBody ?? ''),
              ) ==
              'paid') {
            FFAppState().DonePay = true;
            safeSetState(() {});
            _model.conOrder = await queryOrderRecordCount();
            if (FFAppState().DriverGuideState == true) {
              await OrderRecord.collection.doc().set({
                ...createOrderRecordData(
                  total: FFAppState().totalAllnow3,
                  user: currentUserReference,
                  lokeshn: FFAppState().mkanuserorder,
                  dataOrder: getCurrentTimestamp,
                  cartext: FFAppState().tebycar,
                  carRev: FFAppState().typecarRev,
                  naimUserText: currentUserDisplayName,
                  phoneNumper: valueOrDefault(currentUserDocument?.phoneN, 0),
                  addCartNumer: FFAppState().addcart,
                  villText: FFAppState().villtextnow,
                  citiesUserNow: FFAppState().villnow,
                  totalTaim: FFAppState().totalsaat,
                  vill: FFAppState().villnow,
                  iDorder: ((_model.conOrder!) + 1).toString(),
                  halhOrder: Halh.Pending,
                  schedule: FFAppState().dataSchedule,
                  fullSchedule: FFAppState().fulltextSchedule,
                  halhText: 'بإنتظار قبول المندوب',
                  totalApp: FFAppState().totalapp2,
                  totalVat: FFAppState().vat2,
                  halh: 'بإنتظار قبول المندوب',
                  imgProfileClent: currentUserPhoto,
                  loceshStreng: FFAppState().mkanuserorder?.toString(),
                  allnow: true,
                  activeOrder: false,
                  totalMndob2: FFAppState().totalmndob3,
                  ksm: FFAppState().totalKsm2,
                  driverGuide: true,
                  reviewMndonsend: false,
                  retengUser: valueOrDefault<double>(
                    functions
                        .averageRating(
                            (currentUserDocument?.reteng.toList() ?? [])
                                .toList())
                        ?.toDouble(),
                    0.0,
                  ),
                  srSAAH: FFAppState().srtypecar.toDouble(),
                  paymentMethod: PaymentMethod.OnlinePayment,
                  idMoyser: MyserGetCall.id(
                    (_model.apiResult5yz?.jsonBody ?? ''),
                  ),
                ),
                ...mapToFirestore(
                  {
                    'listAmakn': getAmaknCostmListFirestoreData(
                      FFAppState().cartmkss,
                    ),
                  },
                ),
              });
              _model.mnadebList = await queryUserRecordOnce(
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
                    ),
              );
              _model.comnadeb = await queryUserRecordCount(
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
                    ),
              );
              for (int loop1Index = 0;
                  loop1Index <= _model.mnadebList!.length;
                  loop1Index++) {
                final currentLoop1Item = _model.mnadebList![loop1Index];
                if (_model.comnadeb == 0) {
                  break;
                } else {
                  triggerPushNotification(
                    notificationTitle: 'طلب جديد',
                    notificationText:
                        'نفيدكم بوجود طلب جديد في تطبيق \"توري تاكسي\" لمدة *${FFAppState().totalsaat.toString()}ساعات  *مع عائد مالي قدره *${FFAppState().totalmndob3.toString()}${FFAppState().RMZCurrency}*                    نرجو منكم التكرم بقبول الطلب من خلال الدخول إلى التطبيق في أقرب وقت ممكن.مع خالص التحية والتقدير،\"',
                    userRefs: [currentLoop1Item.reference],
                    initialPageName: 'List',
                    parameterData: {},
                  );
                }
              }
              FFAppState().totalmndob3 = 0.0;
              safeSetState(() {});
            } else {
              await OrderRecord.collection.doc().set({
                ...createOrderRecordData(
                  total: FFAppState().totalAllnow3,
                  user: currentUserReference,
                  lokeshn: FFAppState().mkanuserorder,
                  dataOrder: getCurrentTimestamp,
                  cartext: FFAppState().tebycar,
                  carRev: FFAppState().typecarRev,
                  naimUserText: currentUserDisplayName,
                  phoneNumper: valueOrDefault(currentUserDocument?.phoneN, 0),
                  addCartNumer: FFAppState().addcart,
                  villText: FFAppState().villtextnow,
                  citiesUserNow: FFAppState().villnow,
                  totalTaim: FFAppState().totalsaat,
                  vill: FFAppState().villnow,
                  iDorder: ((_model.conOrder!) + 1).toString(),
                  halhOrder: Halh.Pending,
                  schedule: FFAppState().dataSchedule,
                  fullSchedule: FFAppState().fulltextSchedule,
                  halhText: 'بإنتظار قبول المندوب',
                  totalApp: FFAppState().totalapp2,
                  totalVat: FFAppState().vat2,
                  halh: 'بإنتظار قبول المندوب',
                  imgProfileClent: currentUserPhoto,
                  loceshStreng: FFAppState().mkanuserorder?.toString(),
                  allnow: true,
                  activeOrder: false,
                  totalMndob2: FFAppState().totalmndob3,
                  ksm: FFAppState().totalKsm2,
                  driverGuide: false,
                  reviewMndonsend: false,
                  retengUser: valueOrDefault<double>(
                    functions
                        .averageRating(
                            (currentUserDocument?.reteng.toList() ?? [])
                                .toList())
                        ?.toDouble(),
                    0.0,
                  ),
                  srSAAH: FFAppState().srtypecar.toDouble(),
                  paymentMethod: PaymentMethod.OnlinePayment,
                  idMoyser: MyserGetCall.id(
                    (_model.apiResult5yz?.jsonBody ?? ''),
                  ),
                ),
                ...mapToFirestore(
                  {
                    'listAmakn': getAmaknCostmListFirestoreData(
                      FFAppState().cartmkss,
                    ),
                  },
                ),
              });
            }
          } else {
            FFAppState().DonePay = false;
            safeSetState(() {});
          }
        }
      }
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (FFAppState().DonePay == true)
              Container(
                width: double.infinity,
                height: 422.6,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 140.0,
                        height: 140.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Icon(
                            Icons.check_rounded,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 60.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation1']!),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '4z6c8kax' /* Payment Confirmed! */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .displaySmallFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .displaySmallIsCustom,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 8.0, 24.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'u59e07ie' /* "Your request has been sent su... */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelLargeIsCustom,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            32.0, 20.0, 32.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 14.0, 0.0, 14.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                context.goNamed(
                                    List22TaskOverviewResponsiveWidget
                                        .routeName);
                              },
                              text: FFLocalizations.of(context).getText(
                                'p9jmmxjk' /* Go to Order */,
                              ),
                              icon: const Icon(
                                Icons.call_missed_outgoing_outlined,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: 269.2,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyLargeFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyLargeIsCustom,
                                    ),
                                elevation: 0.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (FFAppState().DonePay == false)
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Icon(
                          Icons.error_sharp,
                          color: FlutterFlowTheme.of(context).error,
                          size: 44.0,
                        ).animateOnPageLoad(
                            animationsMap['iconOnPageLoadAnimation2']!),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 5.0, 9.0, 5.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'bcn7sdi9' /* The last payment was not compl... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).error,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        32.0, 3.0, 32.0, 9.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(2.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (FFAppState().DonePay == false)
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.goNamed(
                            List22TaskOverviewResponsiveWidget.routeName);
                      },
                      text: FFLocalizations.of(context).getText(
                        'bu4ebz14' /* Go to Order */,
                      ),
                      icon: const Icon(
                        Icons.call_missed_outgoing_outlined,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 269.2,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyLarge
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              color: FlutterFlowTheme.of(context).error,
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyLargeIsCustom,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
