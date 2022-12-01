import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:map_note/my_page/working_mapnote.dart';
import 'package:map_note/my_page/finished_mapnote.dart';

import 'package:map_note/my_page/notice.dart';
import 'package:map_note/my_page/settings.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(CupertinoIcons.bell_fill),
                  color: Color.fromRGBO(204, 204, 204, 1),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Notice())
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.gear_solid),
                  color: Color.fromRGBO(204, 204, 204, 1),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Settings())
                    );
                  },
                ),
              ],
              bottom: TabBar(
                  indicatorColor: Color.fromRGBO(255, 147, 101, 1),
                  labelColor: Color.fromRGBO(255, 147, 101, 1),
                  labelStyle: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Color.fromRGBO(255, 147, 101, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelColor: Color.fromRGBO(136, 136, 136, 1),
                  unselectedLabelStyle: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Color.fromRGBO(136, 136, 136, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  tabs: <Widget>[
                    Tab(
                        text: '진행중'
                    ),
                    Tab(
                        text: '완료'
                    ),
                  ])
          ),

          body: TabBarView(
              children: <Widget>[WorkingMapnote(), FinishedMapnote()]
          )
      ),
    );
  }
}