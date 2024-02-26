// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/pages/HomePage.dart';

void main() async {
  //initialize the hive
  //to use the hive we need to make the main function async and await the hive initialization
  await Hive.initFlutter();


  try {
    // Open a box
     await Hive.openBox("mybox");




  } catch (error) {
    print("Error during Hive initialization: $error");
    // Handle the error appropriately, e.g., show an error message or exit the app
  }
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"to do app",
      home: HomePage(),
      
    );
  }
}