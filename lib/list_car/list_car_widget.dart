import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'list_car_model.dart';
export 'list_car_model.dart';

/// Create a car listing page in FlutterFlow for a mobile app.
///
/// Each list item should display the following:
///
/// A car image (as a thumbnail or card image).
///
/// The minimum rental duration in hours (e.g., "Min: 3 hours").
///
/// The hourly rental price (e.g., "$20/hour").
///
/// A button labeled "Select" aligned to the right of each item.
///
/// Use a scrollable ListView or Column with clean card-style containers for
/// each car. Ensure a modern and responsive UI with good spacing and clear
/// typography. The page should be mobile-friendly and optimized for both
/// Android and iOS.
class ListCarWidget extends StatefulWidget {
  const ListCarWidget({super.key});

  static String routeName = 'ListCar';
  static String routePath = '/listCar';

  @override
  State<ListCarWidget> createState() => _ListCarWidgetState();
}

class _ListCarWidgetState extends State<ListCarWidget> {
  late ListCarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListCarModel());

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
              'xkofy828' /* List of cars */,
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
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 0.0, 16.0, 0.0),
                
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 0.0, 16.0, 0.0),
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
final sortedList = List<TypeCarRecord>.from(listViewTypeCarRecordList)
  ..sort((a, b) => a.nesbahkKsm.compareTo(b.nesbahkKsm));

                      return ListView.separated(
                        padding: EdgeInsets.all(8),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: sortedList.length,
                        separatorBuilder: (_, __) =>
                             SizedBox(height: 12.0.h),
                        itemBuilder: (context, listViewIndex) {
                          final listViewTypeCarRecord =
                              sortedList[listViewIndex];
                          return Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(17.0),
                                          bottomRight: Radius.circular(17.0),
                                          topLeft: Radius.circular(17.0),
                                          topRight: Radius.circular(17.0),
                                        ),
                                        child: Image.network(
                                          listViewTypeCarRecord.img,
                                          width: 80.0.h,
                                          height: 100.0.w,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listViewTypeCarRecord.naim,
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeIsCustom,
                                                ),
                                          ),
                                          Text(
                                            '${formatNumber(
                                              listViewTypeCarRecord.sr,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            )}/للساعة الواحدة',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                          Text(
                                            'الحد الأدنى: ${listViewTypeCarRecord.aglSaat == 1 ? 'ساعة واحدة' : '${listViewTypeCarRecord.aglSaat.toString()} ساعات '}',
                                            style: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumIsCustom,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 4.0)),
                                      ),
                                    ].divide(const SizedBox(width: 5.0)),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
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
                                                listViewTypeCarRecord.sr,
                                                8.0)!;
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
                                        FFAppState().totalKsm = 0;
                                        FFAppState().UbKsm = 0;
                                        FFAppState().NsbhKsm = 0.0;
                                        FFAppState().totalKsm2 = 0.0;
                                        FFAppState().update(() {});
                                        FFAppState().TOTALmndob2 =
                                            functions.total(
                                                FFAppState().srtypecar,
                                                FFAppState()
                                                    .totalsaat
                                                    .toDouble())!;
                                        FFAppState().totalapp2 =
                                            functions.vat(
                                                10.0,
                                                functions.total(
                                                    FFAppState().srtypecar,
                                                    FFAppState()
                                                        .totalsaat
                                                        .toDouble()))!;
                                        FFAppState().vat2 = functions.vat(
                                            FFAppState().VatDolh.toDouble(),
                                            functions.total(
                                                FFAppState().srtypecar,
                                                FFAppState()
                                                    .totalsaat
                                                    .toDouble()))!;
                                        FFAppState().totalAllNow2 =
                                            FFAppState().TOTALmndob2 +
                                                FFAppState().totalapp2 +
                                                FFAppState().vat2;
                                        FFAppState().totalKsm = 0;
                                        FFAppState().UbKsm =
                                            listViewTypeCarRecord.totalKsmUb;
                                        FFAppState().NsbhKsm =
                                            listViewTypeCarRecord.nesbahkKsm;
                                        FFAppState().totalmndob3 = functions
                                            .total(
                                                FFAppState().srtypecar,
                                                FFAppState()
                                                    .totalsaat
                                                    .toDouble())!
                                            .toDouble();
                                        safeSetState(() {});
                                        FFAppState().TOTALmndob2 =
                                            FFAppState().TOTALmndob2 -
                                                FFAppState().totalapp2 -
                                                FFAppState().vat2;
                                        FFAppState().totalAllNow2 =
                                            FFAppState().TOTALmndob2 +
                                                FFAppState().totalapp2 +
                                                FFAppState().vat2;
                                        FFAppState().totalmndob3 =
                                            FFAppState().totalmndob3 +
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
                                                8.0)!;
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
                                        FFAppState().totalKsm = 0;
                                        FFAppState().UbKsm = 0;
                                        FFAppState().NsbhKsm = 0.0;
                                        FFAppState().totalKsm2 = 0.0;
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
                                                    FFAppState().srtypecar,
                                                    FFAppState()
                                                        .totalsaat
                                                        .toDouble()))!;
                                        FFAppState().vat2 = functions.vat(
                                            FFAppState().VatDolh.toDouble(),
                                            functions.total(
                                                FFAppState().srtypecar,
                                                FFAppState()
                                                    .totalsaat
                                                    .toDouble()))!;
                                        FFAppState().totalAllNow2 =
                                            FFAppState().TOTALmndob2 +
                                                FFAppState().totalapp2 +
                                                FFAppState().vat2;
                                        FFAppState().totalKsm = 0;
                                        FFAppState().UbKsm =
                                            listViewTypeCarRecord.totalKsmUb;
                                        FFAppState().NsbhKsm =
                                            listViewTypeCarRecord.nesbahkKsm;
                                        FFAppState().totalmndob3 = functions
                                            .total(
                                                FFAppState().srtypecar,
                                                FFAppState()
                                                    .totalsaat
                                                    .toDouble())!
                                            .toDouble();
                                        FFAppState().update(() {});
                                        FFAppState().totalmndob3 = functions
                                            .total(
                                                FFAppState().srtypecar,
                                                FFAppState()
                                                    .totalsaat
                                                    .toDouble())!
                                            .toDouble();
                                        safeSetState(() {});
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
                                                FFAppState().vat2;
                                        FFAppState().totalAllnow3 =
                                            FFAppState().totalmndob3 +
                                                FFAppState().totalapp2 +
                                                FFAppState().vat2;
                                        FFAppState().update(() {});
                              
                                        context.pushNamed(
                                            Checkout66Widget.routeName);
                                      }
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'mx4hp3oi' /* Select */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 50.24.w,
                                      height: 40.0.h,
                                      padding: const EdgeInsets.all(8.0),
                                      iconPadding: const EdgeInsetsDirectional
                                          .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            color:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodySmallIsCustom,
                                          ),
                                      elevation: 0.0,
                                      borderRadius:
                                          BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
