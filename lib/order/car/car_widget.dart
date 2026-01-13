import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_model.dart';
export 'car_model.dart';

class CarWidget extends StatefulWidget {
  const CarWidget({super.key});

  static String routeName = 'car';
  static String routePath = '/car';

  @override
  State<CarWidget> createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> with TickerProviderStateMixin {
  late CarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarModel());

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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '3ve8qodr' /* Choose the type of car. */,
            ),
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                  child: StreamBuilder<List<TypeCarRecord>>(
                    stream: queryTypeCarRecord(
                      queryBuilder: (typeCarRecord) => typeCarRecord.where(
                        'actev',
                        isEqualTo: true,
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
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<TypeCarRecord> listViewTypeCarRecordList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewTypeCarRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTypeCarRecord =
                              listViewTypeCarRecordList[listViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 1.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: const Offset(
                                      0.0,
                                      1.0,
                                    ),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (listViewTypeCarRecord.ishafelh ==
                                        true) {
                                      FFAppState().tebycar =
                                          listViewTypeCarRecord.naim;
                                      FFAppState().typecarRev =
                                          listViewTypeCarRecord.reference;
                                      FFAppState().srtypecar =
                                          listViewTypeCarRecord.sr;
                                      FFAppState().totalsaatandcar =
                                          functions.total(
                                              listViewTypeCarRecord.sr, 8.0)!;
                                      FFAppState().notcar =
                                          listViewTypeCarRecord.not;
                                      FFAppState().saatcar =
                                          listViewTypeCarRecord.aglSaat;
                                      FFAppState().onsaahcar =
                                          listViewTypeCarRecord.sr;
                                      FFAppState().totalsaat =
                                          listViewTypeCarRecord.aglSaat;
                                      FFAppState().addhors = 0;
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
                                      FFAppState().totalapp2 = functions.vat(
                                          15.0,
                                          functions.total(
                                              FFAppState().srtypecar,
                                              FFAppState()
                                                  .totalsaat
                                                  .toDouble()))!;
                                      FFAppState().vat2 = functions.vat(
                                          15.0,
                                          functions.vat(
                                              15.0,
                                              functions.total(
                                                  FFAppState().srtypecar,
                                                  FFAppState()
                                                      .totalsaat
                                                      .toDouble())))!;
                                      FFAppState().totalAllNow2 =
                                          FFAppState().TOTALmndob2 +
                                              FFAppState().totalapp2 +
                                              FFAppState().vat2;
                                      safeSetState(() {});

                                      context.pushNamed(
                                          Checkout66Widget.routeName);
                                    } else {
                                      FFAppState().tebycar =
                                          listViewTypeCarRecord.naim;
                                      FFAppState().typecarRev =
                                          listViewTypeCarRecord.reference;
                                      FFAppState().srtypecar =
                                          listViewTypeCarRecord.sr;
                                      FFAppState().totalsaatandcar =
                                          functions.total(
                                              listViewTypeCarRecord.sr,
                                              FFAppState()
                                                  .cartPriceSummary
                                                  .length
                                                  .toDouble())!;
                                      FFAppState().saatcar =
                                          listViewTypeCarRecord.aglSaat;
                                      FFAppState().onsaahcar =
                                          listViewTypeCarRecord.sr;
                                      FFAppState().totalsaat =
                                          listViewTypeCarRecord.aglSaat;
                                      FFAppState().addhors = 0;
                                      safeSetState(() {});
                                      await geminiGenerateText(
                                        context,
                                        'هل من المنطقي ان ينتقل السائح بسيارة بسرعة معقولة  من  ${FFAppState().villtextnow}إلى المدن${FFAppState().textallAlmdn}بـ${FFAppState().totalsaat.toString()}ساعاتإذا كانت  الرحلة اساسا تستغرق 0 ساعات ولايوجد سفر  أكتب فقط(  لايوجد ملاحظات على )الرحلة نتمنى لكم رحلة موفقة وسعيدة واذا كان الرحلة تتطلب السفر  اقترح على المستخدم ساعات معينة اكتب مختصر وواضح بالعربية والإنجليزية',
                                      ).then((generatedText) {
                                        safeSetState(() =>
                                            _model.msegai2 = generatedText);
                                      });

                                      FFAppState().msegAi = _model.msegai2!;
                                      safeSetState(() {});

                                      context.pushNamed(
                                          Checkout66Widget.routeName);
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        child: Image.network(
                                          listViewTypeCarRecord.img,
                                          width: 60.0,
                                          height: 60.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '${listViewTypeCarRecord.naim} - ${formatNumber(
                                                  listViewTypeCarRecord.sr,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: 'ر.س ',
                                                )} للساعة الواحدة- الحد الأدنى ${listViewTypeCarRecord.aglSaat.toString()} ساعات ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLargeIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.done,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
