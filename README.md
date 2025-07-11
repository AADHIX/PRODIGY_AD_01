# Flutter Calculator App

A clean, responsive calculator application built with Flutter that works seamlessly across all Android screen sizes. Features a modern Material Design interface with intuitive touch controls and smooth animations.

## 📱 Features

- **Basic Arithmetic Operations**: Addition, subtraction, multiplication, and division
- **Responsive Design**: Adapts to all Android screen sizes and orientations
- **Clean UI**: Modern Material Design with intuitive button layout
- **Error Handling**: Handles division by zero and invalid operations
- **Clear Function**: AC (All Clear) button to reset calculations
- **Real-time Display**: Live updates as you input numbers and operations

## 🏗️ Architecture Overview

### Widget Tree Structure

The app follows a hierarchical widget structure designed for maintainability and responsiveness:

```
CalculatorApp (StatelessWidget)
└── MaterialApp
    └── Calculator (StatefulWidget)
        └── Scaffold
            ├── AppBar
            └── Container (body)
                └── SafeArea
                    └── Column
                        ├── Display Area (30% of screen)
                        └── Button Area (70% of screen)
```

### Key Components

#### 🎯 **Core Widgets**
- **`CalculatorApp`** - Entry point and app configuration
- **`Calculator`** - Main StatefulWidget containing all logic
- **`CalculatorButton`** - Reusable button component
- **`TallCalculatorButton`** - Special button for equals operation

#### 📱 **Layout System**
- **Display Area**: Takes 30% of available space (flex: 3)
- **Button Area**: Takes 70% of available space (flex: 7)
- **5 Button Rows**: Organized in a grid layout using Row and Column widgets

#### 🔢 **Button Layout**
```
Row 1: [AC] [/] [*] [-]
Row 2: [7] [8] [9] [+]
Row 3: [4] [5] [6] [=]
Row 4: [1] [2] [3] [=]
Row 5: [0] [0] [.] [=]
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Android Studio or VS Code
- Android SDK for device/emulator testing

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/flutter-calculator.git
   cd flutter-calculator
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Project Structure

```
lib/
├── main.dart                 # Entry point
├── widgets/
│   ├── calculator_button.dart
│   └── tall_calculator_button.dart
├── screens/
│   └── calculator_screen.dart
└── utils/
    └── calculator_logic.dart
```

## 🎨 Design Principles

### Responsive Design
- **MediaQuery-based sizing**: All dimensions scale with screen size
- **Flexible layouts**: Uses Expanded and Flex widgets for adaptability
- **SafeArea protection**: Ensures content stays within safe screen boundaries

### Material Design
- **Elevated buttons**: Provides tactile feedback
- **Consistent spacing**: Uses systematic padding and margins
- **Color scheme**: Dark background with contrasting button colors
- **Typography**: Scalable text with FittedBox widgets

### User Experience
- **Large touch targets**: Buttons are sized for easy interaction
- **Visual feedback**: Button presses provide immediate response
- **Clear display**: Large, readable numbers with right alignment
- **Intuitive layout**: Standard calculator button arrangement

## 🔧 State Management

The app uses Flutter's built-in `setState()` pattern for state management:

### State Variables
```dart
class _CalculatorState extends State<Calculator> {
  String display = '0';
  double previousNumber = 0;
  String operator = '';
  double currentNumber = 0;
  bool shouldResetDisplay = false;
}
```

### State Flow
```
User Input → Button Widget → onPressed() → setState() → UI Rebuild
```

## 🎯 Key Features Implementation

### Display Area
- **FittedBox**: Automatically scales text to fit available space
- **Right alignment**: Numbers align to the right like traditional calculators
- **Responsive text**: Adjusts size based on screen dimensions

### Button Grid
- **5 rows × 4 columns**: Standard calculator layout
- **Flexible sizing**: Each button takes equal space with Expanded widgets
- **Special buttons**: Zero button spans 2 columns, equals button spans 2 rows

### Calculator Logic
- **Sequential operations**: Handles chained calculations
- **Error handling**: Prevents division by zero
- **Decimal support**: Handles decimal point operations
- **Clear function**: AC button resets all values

## 🔄 Widget Lifecycle

### Build Process
1. **MaterialApp** provides theme and navigation
2. **Scaffold** creates basic layout structure
3. **SafeArea** handles screen boundaries
4. **Column** creates vertical layout
5. **Expanded** widgets distribute space
6. **Buttons** handle user interactions

### State Updates
1. User taps button
2. `onPressed()` callback triggered
3. Calculator logic processes input
4. `setState()` called with new values
5. Widget tree rebuilds with updated display

## 📊 Performance Considerations

- **Efficient rebuilds**: Only necessary widgets rebuild on state changes
- **Minimal widget depth**: 11 levels maximum for optimal performance
- **Reusable components**: Custom button widgets reduce code duplication
- **Memory management**: Proper disposal of resources

## 🧪 Testing

### Unit Tests
```bash
flutter test
```

### Widget Tests
```bash
flutter test test/widget_test.dart
```

### Integration Tests
```bash
flutter test integration_test/
```

## 🔧 Customization

### Theming
Modify colors, fonts, and styles in `MaterialApp`:
```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    // Add your custom theme
  ),
)
```

### Button Styles
Update button appearance in `CalculatorButton` widget:
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    // Customize button style
  ),
)
```

## 🐛 Troubleshooting

### Common Issues

1. **Overflow errors**: Check FittedBox implementation
2. **Button sizing**: Verify Expanded widget usage
3. **State not updating**: Ensure setState() is called
4. **Layout issues**: Check MediaQuery values

### Debug Mode
Run with debug information:
```bash
flutter run --debug
```

## 📱 Supported Platforms

- ✅ Android (API 21+)
- ✅ iOS (iOS 12+)
- ✅ Web (responsive design)
- ✅ Desktop (Windows, macOS, Linux)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI guidelines
- Community contributors and testers

## 📞 Support

For issues and questions:
- Create an issue on GitHub
- Check the Flutter documentation
- Join the Flutter community on Discord

---

**Built with ❤️ using Flutter**
