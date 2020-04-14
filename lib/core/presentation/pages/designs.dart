import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/presentation/widgets/expandable_list_view.dart';

import '../routes/designs_routes.dart';

class DesignsMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ExpandableListView(pages);
  }
}