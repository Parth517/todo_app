
import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //refernece the hive box
  final _myBox=Hive.box('myBox');
  ToDoDataBase db =ToDoDataBase();

  void initState(){

    //if this is the first time ever opening the 
    //app create default data
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      //already exists data
      db.loadData();
    }
    super.initState();
  }

  //text Controller
  final _controller=TextEditingController();

  //list todp tasks=


  //checkbox was tapped
  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.ToDoList[index][1]=!db.ToDoList[index][1];
    });
    db.updateDataBase();
  }

   void saveNewTask(){
    setState(() {
      db.ToDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
        db.updateDataBase();

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

  //Delete Task
  void deleteTask(int index){
    setState(() {
      db.ToDoList.removeAt(index);
    });
        db.updateDataBase();

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
        itemCount: db.ToDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(
            taskName: db.ToDoList[index][0],
            taskCompleted: db.ToDoList[index][1],
              onChanged: (value) =>checkBoxChanged(value,index),
              deleteFunction:(context) => deleteTask(index),
          );
        },
      )
    );
  }
}