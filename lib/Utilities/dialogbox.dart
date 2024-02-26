
import 'package:flutter/material.dart';
import 'package:todoapp/Utilities/MyButton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({
     super.key,
     required this.controller,
     required this.onSave,
     required this.onCancel,
   });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content:Container(
        height:120,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //text input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',

              ),
            ),
            //Add Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(onPressed:onSave, text: "Save"),
                SizedBox(width: 20,),
                MyButton(onPressed: onCancel, text: "cancel")
              ],
            ),


          ],
        )

      )
    );
  }
}
