import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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

class MapnotesPage extends StatefulWidget {
  @override
  _MapnotesPageState createState() => _MapnotesPageState();
}

class _MapnotesPageState extends State<MapnotesPage> {

  Marker marker = new Marker(markerId: 'first', position: LatLng(33.5178257, 126.8621147));

  final double _initFabHeight = 120.0;
  double _fabHeight = 300;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 200.0;

  List<Map<String, dynamic>> mapnoteList = [];
  int mapnoteListLength = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<NaverMapController> _controller = Completer();


  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
    getMapnotes();
  }

  void getMapnotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var mapnotes_response = await http.get(Uri.parse('http://api.mapnote.link:8080/api/v1/users'),
      headers: {
        "Authorization": prefs.getString('accessToken'),
      },
    );

    if (mapnotes_response.statusCode == 200 || mapnotes_response.statusCode == 201) {
      var mapnotesData = jsonDecode(utf8.decode(mapnotes_response.bodyBytes));

      setState(() {
        mapnotesData['data']['scheduleList'].map((m) => {
          mapnoteList.add(m)
        });
        mapnoteListLength = mapnoteList.length;
      });
    }
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
    print(data);

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
          Positioned(
            right: 20.0,
            bottom: _fabHeight,
            child: FloatingActionButton(
              child: Icon(
                Icons.gps_fixed,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => _determinePosition(),
              backgroundColor: Colors.white,
            ),
          ),

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
                  "내 근처 Mapnote",
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

            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              itemCount: mapnoteListLength,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget> [
                      Icon(
                          CupertinoIcons.star_circle_fill,
                          color: Color.fromRGBO(255, 242, 122, 1),
                          size: 40
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Text(
                            "${mapnoteList[i]['place']['name']}",
                            style: TextStyle(
                              fontFamily: "NotoSansKR",
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            "${mapnoteList[i]['content']}",
                            style: TextStyle(
                              fontFamily: "NotoSansKR",
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ));
  }

  Widget _body() {
    return NaverMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(33.5178257, 126.8621147),
        zoom:15,
      ),
      onMapCreated: _onMapCreated,
      markers: [
        marker
      ],
    );
  }

  void _onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}

