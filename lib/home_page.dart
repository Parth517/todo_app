
import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //list todp tasks=
  List ToDoList=[
    ["Make Breakfast",false],
    ['Do Exercise',false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value,int index){
    setState(() {
      ToDoList[index][1]=!ToDoList[index][1];
    });

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title:Center(child: Text("To Do")),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(
            taskName: ToDoList[index][0],
            taskCompleted: ToDoList[index][1],
              onChanged: (value) =>checkBoxChanged(value,index),
          );
        },
      )
    );
  }
}