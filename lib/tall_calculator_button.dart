import 'package:flutter/material.dart';

// Special Button Widget for Tall Buttons (like equals button)
class TallCalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function() onPressed;

  const TallCalculatorButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSize = screenWidth * 0.08; // Slightly larger for emphasis
    
    return Container(
      width: screenWidth * 0.2, // Responsive width
      height: screenHeight * 0.17, // Tall height for equals button
      margin: EdgeInsets.all(screenWidth * 0.008),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
          ),
          elevation: 5, // Higher elevation for primary button
        ),
        child: FittedBox(
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
    );
  }
}