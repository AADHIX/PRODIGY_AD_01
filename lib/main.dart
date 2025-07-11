import 'package:flutter/material.dart';
import 'calculator.dart'; // Import the calculator widget

void main() {
  runApp(CalculatorApp());
}

// Main App Widget
class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}