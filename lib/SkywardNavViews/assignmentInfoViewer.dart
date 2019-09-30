import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:skymobile/SkywardScraperAPI/SkywardAPITypes.dart';
import 'package:skymobile/SkyMobileHelperUtilities/globalVariables.dart';

class AssignmentInfoViewer extends StatefulWidget {
  MaterialColor secondColor;
  String courseName;

  AssignmentInfoViewer({this.secondColor, this.courseName});
  @override
  _AssignmentInfoViewerState createState() =>
      new _AssignmentInfoViewerState(courseName);
}

class _AssignmentInfoViewerState extends State<AssignmentInfoViewer> {
  String courseName;

  _AssignmentInfoViewerState(this.courseName);

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [];
    for (AssignmentInfoBox box in assignmentInfoBoxes) {
      String uiMessage = box.getUIMessage();
      body.add(Card(
        color: Colors.white10,
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 6 * 4.4),
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Text(
            uiMessage,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.orange, fontSize: 20),
            textAlign: TextAlign.start,
          ),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(courseName != null ? courseName : 'Assignments',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w700)),
        actions: <Widget>[
          Theme(
              data: Theme.of(context).copyWith(
                cardColor: Colors.black87,
              ),
              child: PopupMenuButton(
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                      child: const Text(
                        'Mock Assignment Editing Mode',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 'mockAssignmentEditingMode'),
                  PopupMenuItem<String>(
                      child: const Text(
                        'Grade Predictor',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 'gradePredictor'),
                ],
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: body,
        ),
      ),
    );
  }
}
