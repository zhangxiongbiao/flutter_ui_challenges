/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
 */

import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/presentation/pages/designs.dart';
import 'package:flutter_ui_challenges/core/presentation/pages/plugins.dart';
import 'package:flutter_ui_challenges/core/presentation/pages/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex;
  var _pageTabs = [
    WidgetsMenu(),
    DesignsMenu(),
    PluginsMenu(),
  ];

  @override
  void initState() {
    super.initState();
    _pageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.indigo,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text("UI Challenges"),
        ),
        body: _pageTabs[_pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          backgroundColor: Colors.grey.shade300,
          currentIndex: _pageIndex,
          onTap: (index) => setState(() {
            _pageIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets),
              title: Text("widgets"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              title: Text("design"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.android),
              title: Text("plugins"),
            ),
          ],
        ),
      ),
    );
  }
}
