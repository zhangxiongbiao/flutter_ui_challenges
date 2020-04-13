import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/data/models/survey.dart';

class SurveyWidget extends StatelessWidget {
  final SurveyItem survey;

  const SurveyWidget({Key key, this.survey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(survey.message,style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),),
              ...survey.options.map((option) =>RadioListTile(
                groupValue: null,
                value: survey.optionKeys[survey.options.indexOf(option)],
                title: Text(option),
                onChanged: (val){
                  /*FirestoreService().updateDocument('surveys', survey.id, {
                    val: FieldValue.increment(1),
                  });
                  AuthFirestoreService().updateUserData(Provider.of<UserRepository>(context).user.uid, {"surveys": FieldValue.arrayUnion([survey.id])});
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Thank you for providing us feedback")
                  ));*/
                },
              ))
            ],
          ),
        )
      ),
    );
  }
}