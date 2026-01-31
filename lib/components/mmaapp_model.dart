import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mmaapp_widget.dart' show MmaappWidget;
import 'package:flutter/material.dart';
import 'dart:async';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_model.dart';
import 'mmaapp_widget.dart';

class MmaappModel extends FlutterFlowModel<MmaappWidget> {
  /// State fields for Google Map
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// 🗺️ نقاط المسار (Polyline)
  List<LatLng> routePoints = [];

  @override
  void initState(BuildContext context) {
    routePoints = [];
  }

  @override
  void dispose() {
    routePoints.clear();
  }
}
