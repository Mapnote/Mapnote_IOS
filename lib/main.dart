import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './login/login_page.dart';

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
      home: LoginPage(),
    );
  }
}