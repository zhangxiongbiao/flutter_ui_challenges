import 'package:flutter_ui_challenges/core/data/models/menu.dart';
import 'package:flutter_ui_challenges/src/designs/pages/animations/anim3.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<dynamic> pages = [
  MenuItem(title: "Animations", icon: FontAwesomeIcons.truckMoving, items: [
    SubMenuItem("Fancy Appbar Animation", FancyAppbarAnimation(),
        path: FancyAppbarAnimation.path),
  ]),
];

SubMenuItem getItemForKey(String key) {
  SubMenuItem item;
  List<dynamic> pag = List<dynamic>.from(pages);
  pag.forEach((page) {
    if (page is SubMenuItem && page.title == key) {
      item = page;
    } else if (page is MenuItem) {
      page.items.forEach((sub) {
        if (sub.title == key) item = sub;
      });
    }
  });
  return item;
}
