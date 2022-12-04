import 'package:flutter/material.dart';

class SearchAddressList{
  List<Map<String,dynamic>> address;
  double latitude;
  double longtitude;

  SearchAddressList({this.address, this.latitude, this.longtitude});
  
  // factory SearchAddressList.fromJson(Map<String, dynamic> json) {
  //   return SearchAddressList(
  //       address: json['roadAddress'],
  //       latitude: json['x'],
  //       longtitude: json['y']
  //   );
  // }
}