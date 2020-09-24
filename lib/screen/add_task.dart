import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/models/task.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String updatedDatalist;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add tasks",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
            TextField(
              showCursor: true,
              autofocus: true,
              cursorRadius: Radius.circular(10.0),
              textAlign: TextAlign.center,
              onChanged: (newAddeddata) {
                updatedDatalist = newAddeddata;
              },
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  topLeft: Radius.circular(5.0)),
              child: FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 100),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Provider.of<TaskData>(context,listen: false).addTask(updatedDatalist??'');
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
