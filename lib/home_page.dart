
import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  //text Controller
  final _controller=TextEditingController();

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

   void saveNewTask(){
    setState(() {
      ToDoList.add([_controller.text,false]);
    });
   }

  //create a new task
  void createNewTask(){
     showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel:()=>Navigator.of(context).pop(),
      );
     },
     );
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
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