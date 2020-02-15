import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/screen/task_tile.dart';
import 'package:provider/provider.dart';

class TaskView extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskdata,child){
        return    ListView.builder(
        itemBuilder: (context, index) {
           final task = taskdata.tasks[index]; //shared final task inside this context
          return TaskTile(
              
              taskenote: task.name,
              isChecked: task.isdone,
              checkboxCallBack: (checkboxState) {
                taskdata.checkBoxtick(task);
              },
              callbackForDelete: (){
                taskdata.deleteTask(task);
              },);
        },
        itemCount: taskdata.totalTask,
      );
      },
        
    );
  }
}
