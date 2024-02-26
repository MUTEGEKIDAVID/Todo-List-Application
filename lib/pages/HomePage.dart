// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/Data/Database.dart';
import 'package:todoapp/Utilities/todolist.dart';

import '../Utilities/dialogbox.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

 class _HomePageState extends State<HomePage> {
//accessing the hive
   final _myBox= Hive.box("mybox");
//instantiate the database class
 toDODAtabase db = toDODAtabase();
 @override
  void initState() {

    super.initState();
    //if this is the first time running the app , then load default data

   if(_myBox.get("TODOLIST")==null){
     db.createInitialData();

   }else{
     //there already exists data
     db.loadData();
   }
  }

  final Controller= TextEditingController();

  //list to do tasks
  // List toDoList = [
  //   ['make tutorial', false],
  //   ['do exercise', false]
  // ];

  //checkbox was tapped
  void checkboxchanged(bool value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  db.updateDataBase();
  }
  
    //save new task
    void SaveNewTask(){
      setState(() {
        db.toDoList.add([Controller.text,false]);
        Controller.clear();
        Navigator.of(context).pop();
        db.updateDataBase();
      });

    }
  
  //function to create new task
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: Controller,
            onSave: SaveNewTask,
            onCancel:()=> Navigator.of(context).pop(),
          );

    }
    );
  }
  //function to delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Center(child: Text("To do list")),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          child:Icon(Icons.add),
          onPressed: createNewTask
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                taskname: db.toDoList[index][0],
                taskcompleted: db.toDoList[index][1],
                onChanged: (value) => checkboxchanged(value!, index),
              deleteFunction: (context)=>deleteTask(index),

            );
          },
        ));
  }
}


