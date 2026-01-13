import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_region_model.dart';
export 'list_region_model.dart';

class ListRegionWidget extends StatefulWidget {
  const ListRegionWidget({super.key});

  @override
  State<ListRegionWidget> createState() => _ListRegionWidgetState();
}

class _ListRegionWidgetState extends State<ListRegionWidget> {
  late ListRegionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListRegionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CitiesRecord>>(
      stream: queryCitiesRecord(
        queryBuilder: (citiesRecord) => citiesRecord
            .where(
              'dolh',
              isEqualTo: FFAppState().ShrekNCountry,
            )
            .orderBy('naim'),
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
        List<CitiesRecord> columnCitiesRecordList = snapshot.data!;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(columnCitiesRecordList.length, (columnIndex) {
            final columnCitiesRecord = columnCitiesRecordList[columnIndex];
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().ShrekNRegionText = columnCitiesRecord.naim;
                FFAppState().ShrekNRegionRev = columnCitiesRecord.reference;
                safeSetState(() {});
                Navigator.pop(context);
              },
              child: Material(
                color: Colors.transparent,
                child: ListTile(
                  title: Text(
                    columnCitiesRecord.naim,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleLargeFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).titleLargeIsCustom,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      'wdg29lkf' /* Select  */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelMediumIsCustom,
                        ),
                  ),
                  trailing: Icon(
                    Icons.select_all,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                  contentPadding: const EdgeInsetsDirectional.fromSTEB(
                      12.0, 0.0, 12.0, 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
