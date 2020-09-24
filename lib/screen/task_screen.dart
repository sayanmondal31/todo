

import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/screen/add_task.dart';
import 'package:todo/screen/completedTask.dart';
import 'package:todo/screen/task_view.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    String updatedDatalist = " ";
    String writting_emoji = "📝";

    final _controller = TextEditingController();
    void clearField() => _controller.clear();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:
                EdgeInsets.only(top: 1.0, left: 40, right: 20.0, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // SizedBox(height:10),
                // CircleAvatar(
                //   child: Icon(
                //     Icons.list,
                //     size: 40,
                //     color: Colors.lightBlueAccent,
                //   ),
                //   radius: 30.0,
                //   backgroundColor: Colors.white,
                // ),

                Text(
                  "WorkFlow",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 50,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    // decoration: InputDecoration(
                    //     prefixIcon: Icon(Icons.search),
                    //     hintText: "Search your teacher with area code"),
                    controller: _controller,
                    showCursor: true,
                    autofocus: true,
                    cursorRadius: Radius.circular(10.0),
                    textAlign: TextAlign.center,
                    onChanged: (newAddeddata) {
                      updatedDatalist = newAddeddata;
                    },
                  ),
                ),

                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(updatedDatalist ?? '');
                      clearField();
                    },
                    color: Colors.cyan,
                    elevation: 20,
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.cyanAccent,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${Provider.of<TaskData>(context).totalTask} ${Provider.of<TaskData>(context).totalTask < 2 ? "task" : "tasks"}",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Text(
                      " ${Provider.of<TaskData>(context).totalTask == 0 ? "Click + button to add new work" : "$writting_emoji"}",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        Consumer<TaskData>(
                          builder: (_, taskdata, __) {
                            return FlatButton(
                                onPressed: () => taskdata.deleteAll(),
                                child: Text("Delete all"));
                          },
                        ),
                        FlatButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (context)=>CompletedTask()));
                        }, child: Text("completed"))
                      ],
                    ),
                    
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              // color: Colors.white,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),

              child: TaskView(),
            ),
          )
        ],
      ),
    );
  }
}
