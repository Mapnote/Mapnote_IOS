import 'package:naver_map_plugin/naver_map_plugin.dart' show LatLng;
import 'package:flutter/material.dart';

class LocationClass extends LatLng {
  final double latitude;
  final double longitude;

  const LocationClass({required this.latitude, required this.longitude}) : super(latitude, longitude);
}