import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class WorkingMapnote extends StatefulWidget {
  @override
  _WorkingMapnoteState createState() => _WorkingMapnoteState();
}
class _WorkingMapnoteState extends State<WorkingMapnote> {
  List<Map<String, dynamic>> mapnoteList = [];
  int mapnoteListLength = 0;

  @override
  void initState() {
    super.initState();
    getMapnotes();
  }

  void getMapnotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var mapnotes_response = await http.get(Uri.parse('http://api.mapnote.link:8080/api/v1/users'),
      headers: {
        "Authorization": prefs.getString('accessToken'),
      },
    );

    if (mapnotes_response.statusCode == 200 || mapnotes_response.statusCode == 201) {
      var mapnotesData = jsonDecode(utf8.decode(mapnotes_response.bodyBytes));

      setState(() {
        mapnotesData['data']['scheduleList'].map((m) => {
          mapnoteList.add(m)
        });
        mapnoteListLength = mapnoteList.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            itemCount: mapnoteListLength,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Row(
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
                          "${mapnoteList[i]['place']['name']}",
                          style: TextStyle(
                            fontFamily: "NotoSansKR",
                            color: Color.fromRGBO(136, 136, 136, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "${mapnoteList[i]['content']}",
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
              );
            },
          )
        )
    );
  }
}