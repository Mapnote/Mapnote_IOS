import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:map_note/new_mapnote/new_mapnote_page.dart';
import 'package:map_note/saved_mapnote/saved_mapnote_page.dart';
import 'package:map_note/my_page/user_page.dart';


class MapnoteMain extends StatefulWidget {
  @override
  _MapnoteMainState createState() => _MapnoteMainState();
}

class _MapnoteMainState extends State<MapnoteMain> {
  CupertinoTabBar tabBar;

  @override
  void initState() {
    super.initState();
    tabBar = CupertinoTabBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar)),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.rectangle_grid_2x2_fill)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_fill)),
    ]);
  }

  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
            tabBar: tabBar,
            tabBuilder: (context, index) {
              switch (index) {
                case 0:
                  return NewMapnotePage();
                case 1:
                  return SavedMapnotePage();
                case 2:
                  return UserPage();
                default:
                  return NewMapnotePage();
              }
            }
        );
  }
}