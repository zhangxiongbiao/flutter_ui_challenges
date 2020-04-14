import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/presentation/routes/widgest_routes.dart';
import 'package:flutter_ui_challenges/core/presentation/widgets/expandable_list_view.dart';

class WidgetsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableListView(pages);
  }
}
