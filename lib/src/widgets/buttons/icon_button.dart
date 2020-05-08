import 'package:flutter/material.dart';

class IconButtonExample extends StatelessWidget {
  static final String path = "lib/src/widgets/buttons/icon_button.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IconButton'),
      ),
      body: Material(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.volume_up),
                    tooltip: '调大音量',
                    onPressed: () {},
                  ),
                  Text('音量：10'),
                ],
              ),
              SizedBox(height: 20,),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.android),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
