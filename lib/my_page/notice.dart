import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  @override
  _Notice createState() => _Notice();
}
class _Notice extends State<Notice> {
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