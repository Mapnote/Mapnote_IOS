import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:map_note/new_mapnote/address.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';

import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong/latlong.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class NewMapnotePage extends StatefulWidget {
  @override
  _NewMapnotePageState createState() => _NewMapnotePageState();
}

class _NewMapnotePageState extends State<NewMapnotePage> {
  final _memoController = TextEditingController();

  final double _initFabHeight = 120.0;
  double _fabHeight = 300;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 200.0;

  String location = '어디서';
  String userName;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<NaverMapController> _controller = Completer();


  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;

    setData();
  }

  void submitNewMapnote() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var url = 'http://api.mapnote.link:8080/api/v1/schedule';

    var body = {
      "content": _memoController.text,
      "category": "LIKE",
      "address": prefs.get('selectedJibunAddress'),
      "roadAddress": prefs.get('selectedRoadAddress'),
      "placeName": prefs.get('selectedAddressName'),
      "longitude": double.parse(prefs.get('selectedAddressLong')),
      "latitude": double.parse(prefs.get('selectedAddressLat'))
    };

    var response = await http.post(Uri.parse(url),
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
          "Authorization": prefs.getString('accessToken'),
        },
        encoding: Encoding.getByName("utf-8"));

    var temp = json.decode(response.body);
  }

  void setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        userName = prefs.getString('userName');
        location = '어디서';

        if(prefs.getKeys().isNotEmpty) {
          location = prefs.getString('selectedAddressName');
        }
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var data = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return data;
  }


  @override
  Widget build(BuildContext context) {

    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: 350,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),

          // the fab
          // Positioned(
          //   right: 20.0,
          //   bottom: _fabHeight,
          //   child: FloatingActionButton(
          //     child: Icon(
          //       Icons.gps_fixed,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //     onPressed: () => _determinePosition(),
          //     backgroundColor: Colors.white,
          //   ),
          // ),

          Positioned(
              top: 0,
              child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).padding.top,
                        color: Colors.transparent,
                      )))),

          //the SlidingUpPanel Title

        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {

    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 24.0,
                ),
                Text(
                  "${userName}님 할 일을 기록하세요",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 55.0,
            ),

            Row(
              children: <Widget>[
                SizedBox(width: 44),
                Flexible(
                  fit: FlexFit.tight,
                  child:Text(
                    '${location}',
                    style: TextStyle(
                      fontFamily: "NotoSansKR",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => TempAddress())
                    );
                  },
                  icon: Icon(CupertinoIcons.arrow_right),
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {}, // 아이콘 결정 부분
                  icon: Icon(CupertinoIcons.plus),
                  color: Color.fromRGBO(136, 136, 136, 1),
                ),
                SizedBox(width: 10),
                Flexible(
                  fit: FlexFit.tight,
                  child: TextField(
                    controller: _memoController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      hintText: '무엇을',
                      hintStyle: TextStyle(
                        fontFamily: "NotoSansKR",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 180),
                IconButton(
                  onPressed: () => submitNewMapnote(),
                  icon: Icon(CupertinoIcons.checkmark_alt),
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ));
  }

  Widget _body() {
    return NaverMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(37.49265, 126.8895972),
        zoom:17,
      ),
      onMapCreated: _onMapCreated,
    );
  }

  void _onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}

