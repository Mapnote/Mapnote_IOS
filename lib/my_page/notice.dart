import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:map_note/model/notice.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}
class _NoticeState extends State<Notice> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() {
    // TODO: notice 불러오는 api 호출하기(아이콘 이미지, 장소, 내용, 날짜) -> firebase 연동 예정
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '알림',
          style: TextStyle(
            fontFamily: "NotoSansKR",
            color: Colors.black,
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
        shadowColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          children: <Widget>[
            SizedBox(height: 100.0),
            Column(
              children: <Widget>[
                Text(
                  '아직 알림이 없습니다.',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Color.fromRGBO(136, 136, 136, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }
}