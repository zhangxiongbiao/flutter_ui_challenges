import 'package:flutter_ui_challenges/core/data/models/menu.dart';
import 'package:flutter_ui_challenges/src/widgets/assets/icon_example.dart';
import 'package:flutter_ui_challenges/src/widgets/assets/image_example.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<dynamic> pages = [
  MenuItem(title: "资源、图标、图片", icon: FontAwesomeIcons.image, items: [
    SubMenuItem("Icon", IconExample(), path: IconExample.path),
    SubMenuItem("Image", ImageExample(), path: ImageExample.path),
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
