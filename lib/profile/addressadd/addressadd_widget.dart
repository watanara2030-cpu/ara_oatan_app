import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'addressadd_model.dart';
export 'addressadd_model.dart';

class AddressaddWidget extends StatefulWidget {
  const AddressaddWidget({super.key});

  static String routeName = 'addressadd';
  static String routePath = '/addressadd';

  @override
  State<AddressaddWidget> createState() => _AddressaddWidgetState();
}

class _AddressaddWidgetState extends State<AddressaddWidget> {
  late AddressaddModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressaddModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      FFAppState().LOceshtoaddAdress =
          '${functions.latitudeFromLocation(currentUserLocationValue)},${functions.longFromLocation(currentUserLocationValue)}';
      safeSetState(() {});
      _model.loceshn = currentUserLocationValue;
      safeSetState(() {});
      _model.apiResultvcc = await PENmdenhCall.call(
        io: FFAppState().LOceshtoaddAdress,
      );

      if ((_model.apiResultvcc?.succeeded ?? true)) {
        _model.villCobe = await queryVillagesRecordOnce(
          queryBuilder: (villagesRecord) => villagesRecord.where(
            'naim',
            isEqualTo: PENmdenhCall.name(
              (_model.apiResultvcc?.jsonBody ?? ''),
            ),
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        FFAppState().adressVillRev = _model.villCobe?.reference;
        FFAppState().AdressTelet = '${PENmdenhCall.name(
          (_model.apiResultvcc?.jsonBody ?? ''),
        )}- ${PENmdenhCall.add(
          (_model.apiResultvcc?.jsonBody ?? ''),
        )}- ${PENmdenhCall.address(
          (_model.apiResultvcc?.jsonBody ?? ''),
        )}';
        FFAppState().adressVillTEXT = PENmdenhCall.name(
          (_model.apiResultvcc?.jsonBody ?? ''),
        )!;
        safeSetState(() {});
      } else {
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
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
      }
    });

    _model.tiletTextController ??=
        TextEditingController(text: _model.fullAdress);
    _model.tiletFocusNode ??= FocusNode();

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
              'zznzeuxy' /* Add Your Address */,
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
                Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '1epfep3m' /* Address Details */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .headlineSmallIsCustom,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 6.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'd7eiiez0' /* Note: This is the address wher... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .headlineSmallIsCustom,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFAppState().naimvillatext,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.fullAdress,
                                'يرجى تحديد الموقع الحالي',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 535.27,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 11.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.tiletTextController,
                                    focusNode: _model.tiletFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        '8ssn09j0' /* Address Name (e.g. Home, Work) */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyLargeIsCustom,
                                        ),
                                    validator: _model
                                        .tiletTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: const LatLng(0.0, 0.0));
                              FFAppState().LOceshtoaddAdress =
                                  '${functions.latitudeFromLocation(currentUserLocationValue)},${functions.longFromLocation(currentUserLocationValue)}';
                              safeSetState(() {});
                              _model.loceshn = currentUserLocationValue;
                              safeSetState(() {});
                              await _model.googleMapsController.future.then(
                                (c) => c.animateCamera(
                                  CameraUpdate.newLatLng(
                                      _model.loceshn!.toGoogleMaps()),
                                ),
                              );
                              _model.apiResultvccCopy2 =
                                  await PENmdenhCall.call(
                                io: FFAppState().LOceshtoaddAdress,
                              );

                              if ((_model.apiResultvccCopy2?.succeeded ??
                                  true)) {
                                _model.villCobe2 =
                                    await queryVillagesRecordOnce(
                                  queryBuilder: (villagesRecord) =>
                                      villagesRecord.where(
                                    'naim',
                                    isEqualTo: PENmdenhCall.name(
                                      (_model.apiResultvccCopy2?.jsonBody ??
                                          ''),
                                    ),
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                FFAppState().adressVillRev =
                                    _model.villCobe2?.reference;
                                FFAppState().AdressTelet = '${PENmdenhCall.name(
                                  (_model.apiResultvccCopy2?.jsonBody ?? ''),
                                )}- ${PENmdenhCall.add(
                                  (_model.apiResultvccCopy2?.jsonBody ?? ''),
                                )}';
                                FFAppState().adressVillTEXT = PENmdenhCall.name(
                                  (_model.apiResultvccCopy2?.jsonBody ?? ''),
                                )!;
                                safeSetState(() {});
                                _model.idvill = _model.villCobe2?.reference;
                                _model.fullAdress = PENmdenhCall.fullAdress(
                                  (_model.apiResultvccCopy2?.jsonBody ?? ''),
                                );
                                safeSetState(() {});
                              } else {
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
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
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
                            text: FFLocalizations.of(context).getText(
                              'pe6cesry' /* My current location */,
                            ),
                            icon: const Icon(
                              Icons.location_pin,
                              size: 12.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'cairo',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Container(
                            width: 400.0,
                            height: 366.76,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Stack(
                              children: [
                                FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController,
                                  onCameraIdle: (latLng) => safeSetState(
                                      () => _model.googleMapsCenter = latLng),
                                  initialLocation: _model.googleMapsCenter ??=
                                      _model.loceshn!,
                                  markerColor: GoogleMarkerColor.green,
                                  mapType: MapType.hybrid,
                                  style: GoogleMapStyle.standard,
                                  initialZoom: 25.0,
                                  allowInteraction: true,
                                  allowZoom: true,
                                  showZoomControls: true,
                                  showLocation: false,
                                  showCompass: true,
                                  showMapToolbar: true,
                                  showTraffic: true,
                                  centerMapOnMarkerTap: true,
                                  mapTakesGesturePreference: true,
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: PointerInterceptor(
                                    intercepting: isWeb,
                                    child: Icon(
                                      Icons.location_pin,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 25.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 11.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: const LatLng(0.0, 0.0));
                            FFAppState().LOceshtoaddAdress =
                                '${functions.latitudeFromLocation(currentUserLocationValue)},${functions.longFromLocation(currentUserLocationValue)}';
                            safeSetState(() {});
                            _model.loceshn = currentUserLocationValue;
                            safeSetState(() {});
                            await _model.googleMapsController.future.then(
                              (c) => c.animateCamera(
                                CameraUpdate.newLatLng(
                                    _model.loceshn!.toGoogleMaps()),
                              ),
                            );
                            _model.aPIsend = await PENmdenhCall.call(
                              io: FFAppState().LOceshtoaddAdress,
                            );

                            _model.villasend = await queryVillagesRecordOnce(
                              queryBuilder: (villagesRecord) =>
                                  villagesRecord.where(
                                'naim',
                                isEqualTo: PENmdenhCall.name(
                                  (_model.aPIsend?.jsonBody ?? ''),
                                ),
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if ((_model.aPIsend?.succeeded ?? true)) {
                              if ((_model.tiletTextController.text != '') &&
                                  (FFAppState().adressVillRev != null) &&
                                  (PENmdenhCall.name(
                                        (_model.aPIsend?.jsonBody ?? ''),
                                      ) ==
                                      FFAppState().adressVillTEXT)) {
                                var adressuserRecordReference =
                                    AdressuserRecord.collection.doc();
                                await adressuserRecordReference.set({
                                  ...createAdressuserRecordData(
                                    user: currentUserReference,
                                    tilet: _model.tiletTextController.text,
                                    map: _model.googleMapsCenter,
                                    naimVill: FFAppState().adressVillTEXT,
                                    vill: _model.idvill,
                                    acctev: true,
                                    textfullAdress: FFAppState().AdressTelet,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'data_add': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                                _model.adressnow =
                                    AdressuserRecord.getDocumentFromData({
                                  ...createAdressuserRecordData(
                                    user: currentUserReference,
                                    tilet: _model.tiletTextController.text,
                                    map: _model.googleMapsCenter,
                                    naimVill: FFAppState().adressVillTEXT,
                                    vill: _model.idvill,
                                    acctev: true,
                                    textfullAdress: FFAppState().AdressTelet,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'data_add': DateTime.now(),
                                    },
                                  ),
                                }, adressuserRecordReference);

                                context.pushNamed(
                                    ListAdressSelectWidget.routeName);
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: const Text('خطا'),
                                        content: const Text(
                                            'تحقّق من أن موقعك الحالي ضمن نفس المدينة، وأكمل جميع البيانات بدقة.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: const Text('تفعيل الموقع'),
                                      content: const Text(
                                          'يجب تفعيل الموقع او تحديد موقعك الحالي'),
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
                          text: FFLocalizations.of(context).getText(
                            '77xoowgb' /* Save Address */,
                          ),
                          icon: const Icon(
                            Icons.add_home_sharp,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
