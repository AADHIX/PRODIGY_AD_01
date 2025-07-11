# PRODIGY_AD_01
A simple Calculator App in Flutter 

# Flutter Calculator Widget Tree

## Visual Widget Hierarchy

```
CalculatorApp (StatelessWidget)
└── MaterialApp
    └── Calculator (StatefulWidget)
        └── Scaffold
            ├── AppBar
            │   └── Text ("Simple Calculator")
            └── Container (body - black background)
                └── SafeArea
                    └── Column
                        ├── Expanded (flex: 3) - Display Area
                        │   └── Container
                        │       └── Align
                        │           └── FittedBox
                        │               └── Text (display value)
                        └── Expanded (flex: 7) - Button Area
                            └── Container
                                └── Column
                                    ├── Expanded - Row 1 (AC, /, *, -)
                                    │   └── Row
                                    │       ├── CalculatorButton ("AC")
                                    │       ├── CalculatorButton ("/")
                                    │       ├── CalculatorButton ("*")
                                    │       └── CalculatorButton ("-")
                                    ├── Expanded - Row 2 (7, 8, 9, +)
                                    │   └── Row
                                    │       ├── CalculatorButton ("7")
                                    │       ├── CalculatorButton ("8")
                                    │       ├── CalculatorButton ("9")
                                    │       └── CalculatorButton ("+")
                                    ├── Expanded - Row 3 (4, 5, 6, =)
                                    │   └── Row
                                    │       ├── CalculatorButton ("4")
                                    │       ├── CalculatorButton ("5")
                                    │       ├── CalculatorButton ("6")
                                    │       └── TallCalculatorButton ("=")
                                    ├── Expanded - Row 4 (1, 2, 3)
                                    │   └── Row
                                    │       ├── CalculatorButton ("1")
                                    │       ├── CalculatorButton ("2")
                                    │       ├── CalculatorButton ("3")
                                    │       └── SizedBox (space for tall =)
                                    └── Expanded - Row 5 (0, .)
                                        └── Row
                                            ├── CalculatorButton ("0", flex: 2)
                                            ├── CalculatorButton (".")
                                            └── SizedBox (space for balance)
```

## Detailed Widget Breakdown

### 🎯 **Root Level**
- **`CalculatorApp`** - Entry point, configures MaterialApp
- **`MaterialApp`** - Provides Material Design theming

### 🏗 **Main Structure**
- **`Calculator`** - StatefulWidget containing all calculator logic
- **`Scaffold`** - Provides basic material design layout structure
- **`AppBar`** - Top navigation bar with title
- **`Container`** - Body wrapper with black background
- **`SafeArea`** - Ensures content stays within safe screen boundaries

### 📱 **Layout Structure**
- **`Column`** - Main vertical layout container
  - **Display Area** (flex: 3) - Takes 30% of available space
  - **Button Area** (flex: 7) - Takes 70% of available space

### 🔢 **Display Area Components**
```
Expanded (flex: 3)
└── Container
    └── Align (alignment: centerRight)
        └── FittedBox (fit: scaleDown)
            └── Text (display value)
```

### 🔘 **Button Area Components**
```
Expanded (flex: 7)
└── Container
    └── Column
        └── 5 × Expanded (button rows)
            └── Row
                └── Multiple CalculatorButton widgets
```

### 🧩 **Custom Widget Components**

#### **CalculatorButton Structure:**
```
CalculatorButton
└── Expanded (flex: 1 or 2)
    └── Container
        └── ElevatedButton
            └── FittedBox
                └── Text
```

#### **TallCalculatorButton Structure:**
```
TallCalculatorButton
└── Container (fixed width & height)
    └── ElevatedButton
        └── FittedBox
            └── Text
```

## 🎨 **Widget Responsibilities**

### **Layout Widgets:**
- **`Column`** - Vertical arrangement of display and buttons
- **`Row`** - Horizontal arrangement of buttons in each row
- **`Expanded`** - Flexible space allocation with flex ratios
- **`Container`** - Styling, padding, margins, colors
- **`SafeArea`** - Screen boundary protection

### **Responsive Widgets:**
- **`MediaQuery`** - Gets screen dimensions
- **`FittedBox`** - Scales content to fit available space
- **`Flexible/Expanded`** - Responsive width/height allocation

### **Interactive Widgets:**
- **`ElevatedButton`** - Clickable buttons
- **`GestureDetector`** - (Implicit in buttons) Touch handling

### **Visual Widgets:**
- **`Text`** - Display numbers and operators
- **`Material/MaterialApp`** - Material Design theming
- **`AppBar`** - Top navigation

## 🔄 **State Management Flow**

```
User Input → Button Widget → onPressed() → setState() → UI Rebuild
```

### **State Variables Location:**
All state variables are stored in `_CalculatorState`:
- `display` - Current display value
- `previousNumber` - First operand
- `operator` - Current operation
- `currentNumber` - Second operand
- `shouldResetDisplay` - Reset flag

## 📊 **Widget Tree Depth Analysis**

- **Maximum Depth:** 11 levels (from CalculatorApp to Text)
- **Average Depth:** 8-9 levels
- **Custom Widgets:** 3 (CalculatorApp, Calculator, CalculatorButton, TallCalculatorButton)
- **Built-in Widgets:** 15+ different types used

## 🎯 **Key Design Patterns**

1. **Composition over Inheritance** - Using multiple simple widgets
2. **Separation of Concerns** - Custom button widgets for reusability
3. **Responsive Design** - MediaQuery-based sizing
4. **State Management** - setState pattern for UI updates
5. **Flexible Layouts** - Expanded and Flex widgets for adaptability

This widget tree structure provides a clean, maintainable, and responsive calculator interface that works across all Android screen sizes!







