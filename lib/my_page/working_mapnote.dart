import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkingMapnote extends StatefulWidget {
  @override
  _WorkingMapnoteState createState() => _WorkingMapnoteState();
}
class _WorkingMapnoteState extends State<WorkingMapnote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            children: <Widget>[
              SizedBox(height: 49),
              Column(
                children: <Widget>[
                  Row(
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
                            'CU 경희대점',
                            style: TextStyle(
                              fontFamily: "NotoSansKR",
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            '포켓몬 빵 사기',
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
                  SizedBox(height: 44),

                  Row(
                    children: <Widget> [
                      Icon(
                          CupertinoIcons.heart_circle_fill,
                          color: Color.fromRGBO(255, 138, 174, 1),
                          size: 40
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Text(
                            'CU 경희대점',
                            style: TextStyle(
                              fontFamily: "NotoSansKR",
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            '포켓몬 빵 사기',
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
                  SizedBox(height: 44),
                  Row(
                    children: <Widget> [
                      Icon(
                          CupertinoIcons.bolt_horizontal_circle_fill,
                          color: Colors.orange,
                          size: 40
                      ),
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Text(
                            'CU 경희대점',
                            style: TextStyle(
                              fontFamily: "NotoSansKR",
                              color: Color.fromRGBO(136, 136, 136, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            '포켓몬 빵 사기',
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
                  SizedBox(height: 44)
                ],
              ),
            ]
          )
        )
    );
  }
}