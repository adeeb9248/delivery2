import 'package:flutter/material.dart';
import 'vegetables_screen.dart'; // Import the file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vegetable Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: VegetablesScreen(), // Call the VegetablesScreen here
    );
  }
}
