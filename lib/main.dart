import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './login/login_page.dart';
import './login/find_user_info.dart';
import './login/find_id.dart';
import './login/join_page.dart';
import './login/join.dart';
import './login/join_complete.dart';
import './my_page/working_mapnote.dart';
import './my_page/user_page.dart';
import './my_page/notice.dart';
import './my_page/settings.dart';
import './instance.dart';

import './new_mapnote/new_mapnote_page.dart';

void main() {
  runApp(MapNote());
}

class MapNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mapnote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:naver_map_plugin/naver_map_plugin.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Naver Map',
//       home: NaverMapTest(),
//     );
//   }
// }
//
// class NaverMapTest extends StatefulWidget {
//   @override
//   _NaverMapTestState createState() => _NaverMapTestState();
// }
//
// class _NaverMapTestState extends State<NaverMapTest> {
//   Completer<NaverMapController> _controller = Completer();
//   MapType _mapType = MapType.Basic;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('NaverMap Test')),
//       body: Container(
//         child: NaverMap(
//           onMapCreated: onMapCreated,
//           mapType: _mapType,
//         ),
//       ),
//     );
//   }
//
//   void onMapCreated(NaverMapController controller) {
//     if (_controller.isCompleted) _controller = Completer();
//     _controller.complete(controller);
//   }
// }