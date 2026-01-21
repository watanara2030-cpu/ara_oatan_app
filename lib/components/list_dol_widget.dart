import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'list_dol_model.dart';
export 'list_dol_model.dart';

class ListDolWidget extends StatefulWidget {
  const ListDolWidget({super.key});

  @override
  State<ListDolWidget> createState() => _ListDolWidgetState();
}

class _ListDolWidgetState extends State<ListDolWidget> {
  late ListDolModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListDolModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CountriesRecord>>(
      stream: queryCountriesRecord(
        queryBuilder: (countriesRecord) => countriesRecord
            .where(
              'acctev',
              isEqualTo: true,
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
        List<CountriesRecord> columnCountriesRecordList = snapshot.data!;

        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children:
                List.generate(columnCountriesRecordList.length, (columnIndex) {
              final columnCountriesRecord =
                  columnCountriesRecordList[columnIndex];
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().ShrekNCountry = columnCountriesRecord.reference;
                  FFAppState().ShrekNCountryText = columnCountriesRecord.naim;
                  safeSetState(() {});
                  Navigator.pop(context);
                },
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text(
                      columnCountriesRecord.naim,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleLargeIsCustom,
                          ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'wjuj6zkt' /* Select the country */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelMediumIsCustom,
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
          ),
        );
      },
    );
  }
}
