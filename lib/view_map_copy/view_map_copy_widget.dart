import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'view_map_copy_model.dart';
export 'view_map_copy_model.dart';

class ViewMapCopyWidget extends StatefulWidget {
  const ViewMapCopyWidget({
    super.key,
    this.map,
  });

  final LatLng? map;

  static String routeName = 'view_mapCopy';
  static String routePath = '/viewMapCopy';

  @override
  State<ViewMapCopyWidget> createState() => _ViewMapCopyWidgetState();
}

class _ViewMapCopyWidgetState extends State<ViewMapCopyWidget> {
  late ViewMapCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewMapCopyModel());

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
        resizeToAvoidBottomInset: false,
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
              'usn2swjj' /* Specify the location on the ma... */,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: FlutterFlowPlacePicker(
                  iOSGoogleMapsApiKey:
                      'AIzaSyDRRdjUdG95Z5IjZqdwo5IP4TyFUi5Cufw',
                  androidGoogleMapsApiKey:
                      'AIzaSyDRRdjUdG95Z5IjZqdwo5IP4TyFUi5Cufw',
                  webGoogleMapsApiKey:
                      'AIzaSyBaX8_V0vDn7hI0JKciKL50q4PWwkjdlqE',
                  onSelect: (place) async {
                    safeSetState(() => _model.placePickerValue = place);
                  },
                  defaultText: FFLocalizations.of(context).getText(
                    '5951u60p' /* Select Location */,
                  ),
                  icon: Icon(
                    Icons.place,
                    color: FlutterFlowTheme.of(context).info,
                    size: 16.0,
                  ),
                  buttonOptions: FFButtonOptions(
                    width: 200.0,
                    height: 40.0,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                        ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Expanded(
                child: FlutterFlowGoogleMap(
                  controller: _model.googleMapsController,
                  onCameraIdle: (latLng) =>
                      safeSetState(() => _model.googleMapsCenter = latLng),
                  initialLocation: _model.googleMapsCenter ??= widget.map!,
                  markerColor: GoogleMarkerColor.green,
                  mapType: MapType.hybrid,
                  style: GoogleMapStyle.standard,
                  initialZoom: 9.0,
                  allowInteraction: true,
                  allowZoom: true,
                  showZoomControls: true,
                  showLocation: true,
                  showCompass: true,
                  showMapToolbar: true,
                  showTraffic: true,
                  centerMapOnMarkerTap: true,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 11.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        _model.placePickerValue.name,
                        'حدد مكان',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        if (_model.placePickerValue.city ==
                            FFAppState().naimvillatext) {
                          FFAppState().addToCartPriceSummary(0.0);
                          FFAppState().addcart = FFAppState().addcart + 1;
                          FFAppState().addToCartmkss(AmaknCostmStruct(
                            naim: _model.placePickerValue.name,
                            user: currentUserReference,
                            loceshn: _model.placePickerValue.latLng,
                            sr: 100.0,
                          ));
                          safeSetState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${_model.placePickerValue.name} تمت الإضافة بنجاح ',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              action: SnackBarAction(
                                label: 'عرض رحلتي',
                                textColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                onPressed: () async {
                                  context.pushNamed(Checkout66Widget.routeName);
                                },
                              ),
                            ),
                          );
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  content: Text(
                                      'يمكنك إختيار مكان داخل مدينة ${FFAppState().naimvillatext} فقط ، او تغيير المدينة'),
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
                      },
                      text: valueOrDefault<String>(
                        'إضافة ${_model.placePickerValue.name}  إلى رحلتي',
                        'إضافة إلى رحلتي',
                      ),
                      icon: const Icon(
                        Icons.add,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .titleSmallIsCustom,
                            ),
                        elevation: 3.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
