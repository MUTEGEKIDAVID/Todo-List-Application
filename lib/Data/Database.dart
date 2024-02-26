
import 'package:hive_flutter/hive_flutter.dart';

class toDODAtabase{

  List toDoList=[];
  //reference the box
  final _myBox= Hive.box("mybox");

  //run this method if its the first time ever running this app
void createInitialData(){
  toDoList = [
    ['make tutorial', false],
    ['do exercise', false]
  ];

}
//load data to database
void loadData(){
  toDoList=_myBox.get("TODOLIST");

}
//update the database
void updateDataBase(){
_myBox.put("TODOLIST",toDoList);
}
}