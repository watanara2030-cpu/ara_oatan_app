import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'map_trdemo_model.dart';
export 'map_trdemo_model.dart';

class MapTrdemoWidget extends StatefulWidget {
  const MapTrdemoWidget({
    super.key,
    required this.idd,
  });

  final DocumentReference? idd;

  static String routeName = 'mapTrdemo';
  static String routePath = '/mapTrdemo';

  @override
  State<MapTrdemoWidget> createState() => _MapTrdemoWidgetState();
}

class _MapTrdemoWidgetState extends State<MapTrdemoWidget> {
  late MapTrdemoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapTrdemoModel());

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
              'cz44jk4s' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'cairo',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<OrderRecord>(
            stream: OrderRecord.getDocument(widget.idd!),
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

              final columnOrderRecord = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 655.08,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 11.0, 0.0, 11.0),
                            child: Builder(builder: (context) {
                              final googleMapMarker = columnOrderRecord.mapuser;
                              return FlutterFlowGoogleMap(
                                controller: _model.googleMapsController,
                                onCameraIdle: (latLng) => safeSetState(
                                    () => _model.googleMapsCenter = latLng),
                                initialLocation: _model.googleMapsCenter ??=
                                    columnOrderRecord.mapuser!,
                                markers: [
                                  if (googleMapMarker != null)
                                    FlutterFlowMarker(
                                      googleMapMarker.serialize(),
                                      googleMapMarker,
                                    ),
                                ],
                                markerColor: GoogleMarkerColor.red,
                                markerImage: const MarkerImage(
                                  imagePath: 'assets/images/car.png',
                                  isAssetImage: true,
                                  size: 53.0 ?? 20,
                                ),
                                mapType: MapType.hybrid,
                                style: GoogleMapStyle.standard,
                                initialZoom: 18.0,
                                allowInteraction: true,
                                allowZoom: true,
                                showZoomControls: true,
                                showLocation: true,
                                showCompass: false,
                                showMapToolbar: true,
                                showTraffic: false,
                                centerMapOnMarkerTap: false,
                                mapTakesGesturePreference: false,
                              );
                            }),
                          ),
                          PointerInterceptor(
                            intercepting: isWeb,
                            child: Stack(
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 11.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await launchMap(
                                          mapType: $ml.MapType.google,
                                          location: columnOrderRecord.mapuser,
                                          title:
                                              'مسار المندوب  ${columnOrderRecord.naimMndobText}',
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'dy7ymsek' /* Google Map */,
                                      ),
                                      icon: const Icon(
                                        Icons.map,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16.0, 0.0, 16.0, 0.0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'cairo',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 11.0, 0.0, 11.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await _model.googleMapsController.future
                                            .then(
                                          (c) => c.animateCamera(
                                            CameraUpdate.newLatLng(
                                                columnOrderRecord.mapuser!
                                                    .toGoogleMaps()),
                                          ),
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'la0sd3jl' /* Agent Location */,
                                      ),
                                      icon: const Icon(
                                        Icons.directions_car,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16.0, 0.0, 16.0, 0.0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'cairo',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
