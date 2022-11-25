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
      home: Settings(),
    );
  }
}
