import 'package:flutter/material.dart';

class FlatButtonExample extends StatelessWidget{
  static final String path = "lib/src/widgets/buttons/flat_button.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlatButton'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: (){},
              child: Text('Flat Button One'),
            ),
            SizedBox(height: 10,),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.black,
              onPressed: (){},
              child: Text('Flat Button Two'),
            ),
            SizedBox(height: 10,),
            ButtonTheme(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              height: 10,
              minWidth: 5,
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.zero,
                splashColor: Colors.black,
                onPressed: (){},
                child: Text('Flat Button Three'),
              ),
            ),
            SizedBox(height: 10,),
            FlatButton.icon(
              icon: Icon(Icons.add, color: Colors.blue,),
              color: Colors.grey.shade100,
              textColor: Colors.blue,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.zero,
              splashColor: Colors.black,
              onPressed: (){},
              label: Text('Flat Button Four'),
            ),
          ],
        ),
      ),
    );
  }
}