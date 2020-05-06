import 'package:flutter/material.dart';

class RaisedButtonExample extends StatelessWidget {
  static final String path = "lib/src/widgets/buttons/raised_button.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RaisedButton'),
      ),
      body: Builder(
        builder: (context) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                    onPressed: null,
                    child:
                        Text('Disabled Button', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 30),
                  RaisedButton(
                    onPressed: () {
                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('You pressed Enabled Button'),
                        action: SnackBarAction(
                          label: 'close',
                          textColor: Colors.red,
                          onPressed: () {
                            Scaffold.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ));
                    },
                    child: const Text('Enabled Button',
                        style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 30),
                  RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('Gradient Button',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // 通过ButtonTheme调整按钮大小，解决Material风格的Button普遍偏大的问题
                  ButtonTheme(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    height: 10,
                    minWidth: 5,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      color: Colors.grey,
                      child: Text('基本信息',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      onPressed: () {
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('你点击了基本信息按钮'),
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
