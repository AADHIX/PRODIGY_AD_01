import 'package:flutter/material.dart';
import 'calculator_button.dart';      // Import regular button widget
import 'tall_calculator_button.dart'; // Import tall button widget

// Calculator Widget - Main calculator logic
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variables to store calculator state
  String display = '0';           // What shows on the screen
  String previousNumber = '';     // The first number in calculation
  String operator = '';           // The operation (+, -, *, /)
  String currentNumber = '';      // The second number in calculation
  bool shouldResetDisplay = false; // Flag to know when to reset display

  // Function to handle number button presses
  void _onNumberPressed(String number) {
    setState(() {
      // If we should reset display (after an operation), start fresh
      if (shouldResetDisplay) {
        display = number;
        currentNumber = number;
        shouldResetDisplay = false;
      } else {
        // If display shows '0', replace it with the new number
        if (display == '0') {
          display = number;
          currentNumber = number;
        } else {
          // Otherwise, add the number to the display
          display += number;
          currentNumber += number;
        }
      }
    });
  }

  // Function to handle operator button presses (+, -, *, /)
  void _onOperatorPressed(String op) {
    setState(() {
      // If we already have an operator and current number, calculate first
      if (operator.isNotEmpty && currentNumber.isNotEmpty) {
        _calculate();
      }
      
      // Store the current display as previous number
      previousNumber = display;
      operator = op;
      currentNumber = '';
      shouldResetDisplay = true;
    });
  }

  // Function to perform the actual calculation
  void _calculate() {
    if (previousNumber.isEmpty || currentNumber.isEmpty || operator.isEmpty) {
      return; // Don't calculate if we don't have all parts
    }

    // Convert strings to numbers for calculation
    double prev = double.parse(previousNumber);
    double current = double.parse(currentNumber);
    double result = 0;

    // Perform calculation based on operator
    switch (operator) {
      case '+':
        result = prev + current;
        break;
      case '-':
        result = prev - current;
        break;
      case '*':
        result = prev * current;
        break;
      case '/':
        if (current != 0) {
          result = prev / current;
        } else {
          // Handle division by zero
          display = 'Error';
          _clear();
          return;
        }
        break;
    }

    // Update display with result
    // If result is a whole number, show it without decimal
    if (result == result.toInt()) {
      display = result.toInt().toString();
    } else {
      display = result.toString();
    }

    // Reset for next calculation
    previousNumber = display;
    operator = '';
    currentNumber = '';
  }

  // Function to handle equals button press
  void _onEqualsPressed() {
    setState(() {
      _calculate();
      shouldResetDisplay = true;
    });
  }

  // Function to clear everything (AC button)
  void _clear() {
    setState(() {
      display = '0';
      previousNumber = '';
      operator = '';
      currentNumber = '';
      shouldResetDisplay = false;
    });
  }

  // Function to handle decimal point
  void _onDecimalPressed() {
    setState(() {
      if (shouldResetDisplay) {
        display = '0.';
        currentNumber = '0.';
        shouldResetDisplay = false;
      } else if (!display.contains('.')) {
        display += '.';
        currentNumber += '.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Calculate responsive font size for display
    final displayFontSize = screenWidth * 0.12; // 12% of screen width
    
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea( // Ensures content stays within safe area
          child: Column(
            children: [
              // Display area - Takes up 30% of available space
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.teal,
                      width: screenWidth * 0.005, // Responsive border width
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FittedBox( // Ensures text fits within container
                      fit: BoxFit.scaleDown,
                      child: Text(
                        display,
                        style: TextStyle(
                          fontSize: displayFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
              // Button area - Takes up 70% of available space
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Column(
                    children: [
                      // Row 1: AC and operators
                      Expanded(
                        child: Row(
                          children: [
                            CalculatorButton(
                              text: 'AC',
                              color: Colors.teal,
                              textColor: Colors.white,
                              onPressed: _clear,
                            ),
                            CalculatorButton(
                              text: '/',
                              color: Colors.teal,
                              textColor: Colors.white,
                              onPressed: () => _onOperatorPressed('/'),
                            ),
                            CalculatorButton(
                              text: '*',
                              color: Colors.teal,
                              textColor: Colors.white,
                              onPressed: () => _onOperatorPressed('*'),
                            ),
                            CalculatorButton(
                              text: '-',
                              color: Colors.teal,
                              textColor: Colors.white,
                              onPressed: () => _onOperatorPressed('-'),
                            ),
                          ],
                        ),
                      ),
                      
                      // Row 2: Numbers 7, 8, 9 and +
                      Expanded(
                        child: Row(
                          children: [
                            CalculatorButton(
                              text: '7',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: () => _onNumberPressed('7'),
                            ),
                            CalculatorButton(
                              text: '8',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: () => _onNumberPressed('8'),
                            ),
                            CalculatorButton(
                              text: '9',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: () => _onNumberPressed('9'),
                            ),
                            CalculatorButton(
                              text: '+',
                              color: Colors.teal,
                              textColor: Colors.white,
                              onPressed: () => _onOperatorPressed('+'),
                            ),
                          ],
                        ),
                      ),
                      
                      // Row 3: Numbers 4, 5, 6 and equals button (part 1)
                      Expanded(
                        child: Row(
                          children: [
                            CalculatorButton(
                              text: '4',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: () => _onNumberPressed('4'),
                            ),
                            CalculatorButton(
                              text: '5',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: () => _onNumberPressed('5'),
                            ),
                            CalculatorButton(
                              text: '6',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: () => _onNumberPressed('6'),
                            ),
                            // Tall equals button spans two rows
                            TallCalculatorButton(
                              text: '=',
                              color: Colors.teal,
                              textColor: Colors.white,
                              onPressed: _onEqualsPressed,
                            ),
                          ],
                        ),
                      ),
                      
                      // Row 4: Numbers 1, 2, 3 (equals button continues)
                      Expanded(
                        child: Row(
                          children: [
                            CalculatorButton(
                              text: '1',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: () => _onNumberPressed('1'),
                            ),
                            CalculatorButton(
                              text: '2',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: () => _onNumberPressed('2'),
                            ),
                            CalculatorButton(
                              text: '3',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: () => _onNumberPressed('3'),
                            ),
                            // Empty space for equals button
                            SizedBox(width: screenWidth * 0.2),
                          ],
                        ),
                      ),
                      
                      // Row 5: 0 and decimal point
                      Expanded(
                        child: Row(
                          children: [
                            CalculatorButton(
                              text: '0',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: () => _onNumberPressed('0'),
                              flex: 2, // Makes zero button twice as wide
                            ),
                            CalculatorButton(
                              text: '.',
                              color: Colors.grey[800]!,
                              textColor: Colors.white,
                              onPressed: _onDecimalPressed,
                            ),
                            // Empty space for visual balance
                            SizedBox(width: screenWidth * 0.2),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}