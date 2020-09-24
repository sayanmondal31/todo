import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo/models/task_data.dart';
import 'package:todo/screen/task_screen.dart';

void main() => runApp(TodoHome());

class TodoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.grey),
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
