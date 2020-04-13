/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/data/models/menu.dart';
import 'package:flutter_ui_challenges/core/presentation/widgets/preview.dart';
import 'package:flutter_ui_challenges/src/pages/bike/bike_details.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes.dart';

class PluginsMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('plugins'));
  }
}