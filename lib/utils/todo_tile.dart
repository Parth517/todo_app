// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  final bool taskCompleted;
  final String taskName;

  Function(bool?)? onChanged;

  Function (BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0,right: 25.0,top: 25),
      child: Dismissible(
        key: Key(taskName),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          color: Color(0xFFFE4A49),
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.delete,color:Colors.white),
          ),
          confirmDismiss: (direction)async{
            if (direction == DismissDirection.endToStart) {
            deleteFunction?.call(context);
            return true; // Dismiss the item
          }
          return false; // Keep the item
          },
        
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:Colors.yellow,
            borderRadius: BorderRadius.circular(12)
            ),
          child:Row(
            children: [
              //task name
              Checkbox(
                value: taskCompleted, onChanged: onChanged,
                activeColor: Colors.black,
                ),
              Text(
                taskName,
                style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough:TextDecoration.none),
                ),
            ],
          ),
          
        ),
      ),
    );
  }
}