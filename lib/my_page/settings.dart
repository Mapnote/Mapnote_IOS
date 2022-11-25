import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}
class _Settings extends State<Settings> {
  bool _value = false;
  double _counter = 2.0;

  onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '설정',
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
            SizedBox(height: 25.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget> [
                    Icon(
                        CupertinoIcons.circle_fill,
                        color: Color.fromRGBO(204, 204, 204, 1),
                        size: 60
                    ),
                    SizedBox(width: 14),
                    Text(
                      '홍길동',
                      style: TextStyle(
                        fontFamily: "NotoSansKR",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 47),

                Row(
                  children: <Widget> [
                    Text(
                      '앱 알림',
                      style: TextStyle(
                        fontFamily: "NotoSansKR",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 220),
                    CupertinoSwitch(
                      value: _value,
                      onChanged: onChanged,
                      activeColor: Color.fromRGBO(255, 147, 101, 1),
                    )
                  ],
                ),

                SizedBox(height: 47),

                Text(
                  '범위 설정',
                  style: TextStyle(
                    fontFamily: "NotoSansKR",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 10),

                Slider(
                  value: _counter,
                  min: 2,
                  max: 10,
                  divisions: 4,
                  activeColor: Color.fromRGBO(255, 147, 101, 1),
                  inactiveColor: Color.fromRGBO(204, 204, 204, 1),
                  onChanged: (value) {
                    setState(() {
                      _counter = value;
                    });
                  },
                ),

                Row(
                  children: <Widget> [
                    SizedBox(width: 10),
                    Text(
                      '2km',
                      style: TextStyle(
                        fontFamily: "NotoSansKR",
                        color: Color.fromRGBO(136, 136, 136, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 250),
                    Text(
                      '10km',
                      style: TextStyle(
                        fontFamily: "NotoSansKR",
                        color: Color.fromRGBO(136, 136, 136, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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