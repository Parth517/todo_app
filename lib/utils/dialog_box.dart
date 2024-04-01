// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:todo_app/utils/my_button.dart";

class DialogBox extends StatelessWidget {
  final controller;
  const DialogBox({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get User input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new  Task"
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save Button
                MyButton(text: "Save", onPressed: (){}),

                const SizedBox(width: 4),

                //cancel Button
                MyButton(text: "Cancel", onPressed: (){}),
              ],
            )
            
          ],
        ),
      ),
    );
  }
}