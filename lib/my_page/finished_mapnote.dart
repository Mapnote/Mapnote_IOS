import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishedMapnote extends StatefulWidget {
  @override
  _FinishedMapnote createState() => _FinishedMapnote();
}

class _FinishedMapnote extends State<FinishedMapnote> {
  // TODO: 완료한 맵노트
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget> [
                ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      primary: Colors.white,
                      minimumSize: Size(80,32),
                      shadowColor: Color.fromRGBO(
                          136, 136, 136, 0.4549019607843137),
                      // alignment: Alignment.center,
                    ),
                    icon: Icon(
                      CupertinoIcons.heart_circle_fill,
                      color: Color.fromRGBO(255, 138, 174, 1),
                      size: 40,
                    ),
                    label: Text('')
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      primary: Colors.white,
                      minimumSize: Size(80,32),
                      shadowColor: Color.fromRGBO(
                          136, 136, 136, 0.4549019607843137),
                      // alignment: Alignment.center,
                    ),
                    icon: Icon(
                      CupertinoIcons.star_circle_fill,
                      color: Color.fromRGBO(255, 242, 122, 1),
                      size: 40,
                    ),
                    label: Text('')
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      primary: Colors.white,
                      minimumSize: Size(80,32),
                      shadowColor: Color.fromRGBO(
                          136, 136, 136, 0.4549019607843137),
                      // alignment: Alignment.center,
                    ),
                    icon: Icon(
                      CupertinoIcons.bolt_horizontal_circle_fill,
                      color: Colors.orange,
                      size: 40,
                    ),
                    label: Text('')
                ),
              ],

            )
        )
    );
  }
}