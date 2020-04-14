import 'package:flutter/material.dart';

class IconExample extends StatelessWidget {
  static final String path = "lib/src/widgets/assets/icon_example.dart";

  const IconExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Icon(
            Icons.image,
            size: 64.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
