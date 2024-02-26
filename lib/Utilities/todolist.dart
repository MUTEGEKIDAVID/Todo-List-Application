// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  Function(BuildContext) deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskname,
      required this.taskcompleted,
      required this.onChanged,
      required this.deleteFunction
      });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0,right:25.0,top:25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion:StretchMotion(),
          children: [
            SlidableAction(
                onPressed:deleteFunction,
              icon: Icons.delete,
              backgroundColor:Colors.red,

            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskcompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              //taak
              Text(taskname,
              style: TextStyle(
                decoration: taskcompleted?TextDecoration.lineThrough:TextDecoration.none
              ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
