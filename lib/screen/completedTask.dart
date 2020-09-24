import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/screen/task_tile.dart';

class CompletedTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<TaskData>(
          builder: (context, completedTaskData, child) {
            return ListView.builder(
              itemCount: completedTaskData.completeTotalTask,
              itemBuilder: (BuildContext context, int index) {
                final completeTask = completedTaskData.completdTasks[index];
                return TaskTile(
                  taskenote: completeTask.name,
                  isChecked: completeTask.isdone,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
