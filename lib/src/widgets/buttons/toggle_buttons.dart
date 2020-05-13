import 'package:flutter/material.dart';

class ToggleButtonsExample extends StatefulWidget {
  static final String path = "lib/src/widgets/buttons/toggle_buttons.dart";

  @override
  State createState() => _ToggleButtonsExampleState();
}

class _ToggleButtonsExampleState extends State<ToggleButtonsExample>{
  final isSelected = <bool>[false, false, false];
  final secondIsSelected = <bool>[false, false, false];
  final threeIsSelected = <bool>[false, false, false];
  final fourIsSelected = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToggleButtons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('多选：'),
                SizedBox(width: 10,),
                ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.ac_unit),
                    Icon(Icons.alarm),
                    Icon(Icons.all_inclusive),
                  ],
                  onPressed: (index){
                    setState(() {
                      isSelected[index] = !isSelected[index];
                    });
                  },
                  isSelected: isSelected,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('多选（至少选择一个）：'),
                SizedBox(width: 10,),
                ToggleButtons(
                  constraints: BoxConstraints(minWidth: 48.0, minHeight: 48.0),
                  children: <Widget>[
                    Icon(Icons.ac_unit),
                    Icon(Icons.alarm),
                    Icon(Icons.all_inclusive),
                  ],
                  onPressed: (index){
                    setState(() {
                      int count = 0;
                      fourIsSelected.forEach((bool val) {
                        if (val) count++;
                      });

                      if (fourIsSelected[index] && count < 2)
                        return;

                      setState(() {
                        fourIsSelected[index] = !fourIsSelected[index];
                      });
                    });
                  },
                  isSelected: fourIsSelected,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('单选：'),
                SizedBox(width: 10,),
                ToggleButtons(
                  constraints: BoxConstraints(minWidth: 48.0, minHeight: 48.0),
                  children: <Widget>[
                    Icon(Icons.ac_unit),
                    Icon(Icons.alarm),
                    Icon(Icons.all_inclusive),
                  ],
                  onPressed: (index){
                    setState(() {
                      for (int buttonIndex = 0; buttonIndex < secondIsSelected.length; buttonIndex++) {
                        if (buttonIndex == index) {
                          secondIsSelected[buttonIndex] = true;
                        } else {
                          secondIsSelected[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  isSelected: secondIsSelected,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('单选（可取消选择）：'),
                SizedBox(width: 10,),
                ToggleButtons(
                  constraints: BoxConstraints(minWidth: 48.0, minHeight: 48.0),
                  children: <Widget>[
                    Icon(Icons.ac_unit),
                    Icon(Icons.alarm),
                    Icon(Icons.all_inclusive),
                  ],
                  onPressed: (index){
                    setState(() {
                      for (int buttonIndex = 0; buttonIndex < threeIsSelected.length; buttonIndex++) {
                        if (buttonIndex == index) {
                          threeIsSelected[buttonIndex] = !threeIsSelected[buttonIndex];
                        } else {
                          threeIsSelected[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  isSelected: threeIsSelected,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
