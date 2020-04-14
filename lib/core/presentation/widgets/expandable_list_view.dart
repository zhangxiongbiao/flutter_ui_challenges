import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/data/models/menu.dart';
import 'package:flutter_ui_challenges/core/presentation/widgets/preview.dart';
import 'package:flutter_ui_challenges/src/designs/pages/bike/bike_details.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 可层级展开的ListView
class ExpandableListView extends StatefulWidget {
  final List<dynamic> pages;

  ExpandableListView(this.pages);

  @override
  State createState() => ExpandableListViewState();
}

class ExpandableListViewState extends State<ExpandableListView> {
  /// 已查阅过的列表项
  Map<String, bool> viewData = <String, bool>{};
  /// 已展开的列表项
  Map<String, bool> _expandedData;
  bool viewDataLoaded;
  bool showNewUiDialog;
  bool dialogShowing;
  List<SubMenuItem> unseen;

  @override
  void initState() {
    super.initState();
    unseen = [];
    viewDataLoaded = false;
    showNewUiDialog = false;
    dialogShowing = false;
    _expandedData = {};
    _getViewData();
  }

  @override
  Widget build(BuildContext context) {
    if (showNewUiDialog && viewDataLoaded) _checkToShowDialog(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        ...widget.pages.map(
              (page) => page is MenuItem
              ? _buildExpandableMenu(page, context)
              : BorderedContainer(
            margin: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 8.0,
            ),
            padding: const EdgeInsets.all(0),
            child: _buildSubMenu(page, context),
          ),
        )
      ],
    );
  }

  Widget _buildExpandableMenu(MenuItem page, BuildContext context) {
    /// 标识该MenuItem下所有子项是否已经全部阅读完了，hasChanges=false表示全部阅读完
    bool hasChanges = false;
    page.items.forEach((item) {
      if (viewData[item.title] != true) {
        hasChanges = true;
        return;
      }
    });

    return BorderedContainer(
      margin: EdgeInsets.symmetric(
          horizontal:
              _expandedData[page.title] != null && _expandedData[page.title]
                  ? 0
                  : 8.0,
          vertical: 4.0),
      padding: const EdgeInsets.all(0),
      elevation: 0,
      child: ExpansionTile(
        onExpansionChanged: (val) {
          setState(() {
            _expandedData[page.title] = val;
          });
        },
        leading: Icon(page.icon),
        title: Text(
          "${page.title} (${page.items.length})",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: hasChanges ? Colors.deepOrange : Colors.black87),
        ),
        children: _buildSubMenus(page.items, context),
      ),
    );
  }

  List<Widget> _buildSubMenus(List<SubMenuItem> items, BuildContext context) {
    final List<Widget> subMenus = [];
    items.forEach((item) => subMenus.add(_buildSubMenu(item, context)));
    return subMenus;
  }

  Widget _buildSubMenu(SubMenuItem item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: ListTile(
        leading: Icon(Icons.arrow_right, color: Colors.deepOrange),
        contentPadding: EdgeInsets.all(0),
        dense: false,
        isThreeLine: false,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.code),
              onPressed: () => _openPage(context, item, OpenMode.CODE),
            ),
          ],
        ),
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.subhead.copyWith(
              color: viewData[item.title] != true
                  ? Colors.deepOrange
                  : Colors.black87),
        ),
        onTap: () => _openPage(context, item, OpenMode.PREVIEW),
      ),
    );
  }

  void _openPage(BuildContext context, SubMenuItem item, OpenMode mode) {
    setState(() {
      viewData[item.title] = true;
    });
    _writeViewData();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => mode == OpenMode.CODE
              ? DesignPreviewsPage(
              page: item.page, title: item.title, path: item.path)
              : item.page,
        ));
  }

  _writeViewData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("page_view_data", json.encode(viewData));
  }

  _getViewData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      viewData = Map<String, bool>.from(json.decode(
          prefs.getString('page_view_data') != null
              ? prefs.getString('page_view_data')
              : "{}"));
      viewDataLoaded = true;
      showNewUiDialog = prefs.getBool('show_new_uis_dialog') ?? true;
    });
    return;
  }

  void _checkToShowDialog(BuildContext context) {
    unseen = [];
    widget.pages.forEach((page) {
      if (page is SubMenuItem && viewData[page.title] != true) unseen.add(page);
      if (page is MenuItem) {
        page.items.forEach((item) {
          if (viewData[item.title] != true) unseen.add(item);
        });
      }
    });
    if (unseen.length > 0 && unseen.length < 8 && !dialogShowing)
      _showNewUisDialog(context);
  }

  _showNewUisDialog(pcontext) async {
    PackageInfo pkg = await PackageInfo.fromPlatform();
    dialogShowing = true;
    showDialog(
        barrierDismissible: false,
        context: pcontext,
        builder: (context) => AlertDialog(
          title: Text(
            "Flutter UI Challenges v${pkg.version}",
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "New UIs you have not viewed",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                ...unseen.map(
                      (item) => ListTile(
                    title: Text(item.title),
                    onTap: () => _openPage(context, item, OpenMode.PREVIEW),
                    trailing: IconButton(
                      icon: Icon(Icons.code),
                      onPressed: () =>
                          _openPage(context, item, OpenMode.CODE),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.pink,
              child: Text("Close & Never Display Again"),
              onPressed: () async {
                (await SharedPreferences.getInstance())
                    .setBool('show_new_uis_dialog', false);
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
