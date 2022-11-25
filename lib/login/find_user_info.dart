import 'package:flutter/material.dart';

import './find_id.dart';
import './find_pw.dart';
import './find_pw_complete.dart';
import './find_id_complete.dart';

class FindUserInfo extends StatefulWidget {
  @override
  _FindUserInfoState createState() => _FindUserInfoState();
}

class _FindUserInfoState extends State<FindUserInfo> {
  var isCompleted = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '아이디 / 비밀번호 찾기',
              style: TextStyle(
                fontFamily: "NotoSansKR",
                color: Color.fromRGBO(136, 136, 136, 1),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              color: Color.fromRGBO(136, 136, 136, 1),
            ),
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
                      text: '아이디 찾기'
                  ),
                  Tab(
                      text: '비밀번호 찾기'
                  ),
            ])
          ),
          body: TabBarView(
            children: <Widget>[isCompleted ? FindId():FindIdComplete(), FindPwComplete()]
          )
        ),
    );
  }
}
