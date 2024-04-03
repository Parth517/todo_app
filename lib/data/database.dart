import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List ToDoList=[];

  //refernece our box
  final _myBox=Hive.box("myBox");

  //run this method to first time open the app
  void createInitialData(){
    ToDoList=[
      ["Make Breakfast",false],
      ["Do Exercise",false]
    ];
  }
  //load the data from database
  void loadData(){
    ToDoList=_myBox.get("TODOLIST");
  }
  //update the database
  void updateDataBase(){
    _myBox.put("TODOLIST", ToDoList);
  }
}