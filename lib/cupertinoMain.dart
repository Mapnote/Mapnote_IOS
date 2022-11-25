import 'package:flutter/cupertino.dart';

class CupertinoMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CupertinoMain();
  }
}

class _CupertinoMain extends State<CupertinoMain> {
  CupertinoTabBar tabBar;

  @override
  void initState() {
    super.initState();
    tabBar = CupertinoTabBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.rectangle_grid_2x2_fill)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_fill)),
    ]);
  }

  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
          tabBar: tabBar,
          tabBuilder: (context, value) {
            if (value == 0) {
              return Container(
                child: Center(
                  child: Text('cupertino tab 1'),
                ),
              );
            } else if(value == 1) {
              return Container(
                child: Center(
                  child: Text('cupertino tab 2'),
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: Text('cupertino tab 3'),
                ),
              );
            }
          }),
    );
  }
}