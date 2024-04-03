import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List ToDoList=[];

  //refernece our box
  final _myBox=Hive.openBox("myBox");
}