import 'package:flutter/material.dart';

// Separate Button Widget Class - Makes code reusable and clean
class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function() onPressed;
  final int flex; // For responsive width control

  // Constructor to initialize button properties
  const CalculatorButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
    this.flex = 1, // Default flex value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Calculate responsive font size based on screen width
    final fontSize = screenWidth * 0.06; // 6% of screen width
    
    // Calculate responsive padding based on screen size
    final padding = screenHeight * 0.02; // 2% of screen height
    
    return Expanded(
      flex: flex, // Allows buttons to take different widths
      child: Container(
        margin: EdgeInsets.all(screenWidth * 0.008), // Responsive margin
        height: screenHeight * 0.08, // Responsive height
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(padding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.025), // Responsive border radius
            ),
            elevation: 3, // Adds shadow for better visual appeal
          ),
          child: FittedBox( // Ensures text fits within button
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}