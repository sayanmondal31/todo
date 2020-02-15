import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskenote;
  final bool isChecked ;
  final Function checkboxCallBack;
  final Function callbackForDelete;
  
  TaskTile({this.taskenote,this.isChecked,this.checkboxCallBack,this.callbackForDelete});

  

  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: callbackForDelete,
      leading: Text(
        taskenote,
        style: TextStyle(
          fontSize: 20,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: 
       Checkbox(
        activeColor: Colors.blue,
        value: isChecked,
        onChanged: checkboxCallBack
        ),
      
    );
  }
}
