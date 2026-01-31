import 'package:ara_oatan_app/components/mmaapp_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MmaappWidget extends StatefulWidget {
  const MmaappWidget({super.key});

  @override
  State<MmaappWidget> createState() => _MmaappWidgetState();
}

class _MmaappWidgetState extends State<MmaappWidget> {
  late MmaappModel _model;
  LatLng? currentUserLocationValue;

  double totalDistanceKm = 0;
  double totalTimeHours = 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MmaappModel());

    getCurrentUserLocation(
      defaultLocation: const LatLng(0, 0),
      cached: true,
    ).then((loc) {
      safeSetState(() {
        currentUserLocationValue = loc;
        _calculateRoute();
      });
    });
  }

  /// 📏 حساب المسافة
  double _distance(LatLng start, LatLng end) {
    return Geolocator.distanceBetween(
          start.latitude,
          start.longitude,
          end.latitude,
          end.longitude,
        ) /
        1000;
  }

  /// ⏱️ حساب الوقت
  double _time(double distanceKm, {double speedKmH = 50}) {
    return distanceKm / speedKmH;
  }

  /// 🗺️ تجهيز المسار + الحسابات
  void _calculateRoute() {
    if (currentUserLocationValue == null) return;

    final destinations = FFAppState()
        .cartmkss
        .map((e) => e.loceshn)
        .withoutNulls
        .toList();

    totalDistanceKm = 0;
    _model.routePoints.clear();

    _model.routePoints.add(currentUserLocationValue!);

    for (final dest in destinations) {
      totalDistanceKm += _distance(currentUserLocationValue!, dest);
      _model.routePoints.add(dest);
    }

    totalTimeHours = _time(totalDistanceKm);
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: const Center(
          child: SpinKitChasingDots(
            color: Colors.blue,
            size: 50,
          ),
        ),
      );
    }

    return Column(
      children: [
        /// 🗺️ الخريطة
        Container(
          height: 400,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: FlutterFlowGoogleMap(
            controller: _model.googleMapsController,
            initialLocation:
                _model.googleMapsCenter ??= currentUserLocationValue!,
            markers: FFAppState()
                .cartmkss
                .map((e) => e.loceshn)
                .withoutNulls
                .map((m) => FlutterFlowMarker(m.serialize(), m))
                .toList(),
           
            initialZoom: 10,
            showLocation: true,
            showTraffic: true,
            allowZoom: true,
            allowInteraction: true,
          ),
        ),

        /// 📊 معلومات المسافة والوقت
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📏 المسافة الإجمالية',
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
                Text(
                  '${totalDistanceKm.toStringAsFixed(2)} كم',
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  '⏱️ الوقت التقريبي',
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
                Text(
                  totalTimeHours < 1
                      ? '${(totalTimeHours * 60).round()} دقيقة'
                      : '${totalTimeHours.toStringAsFixed(1)} ساعة',
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
