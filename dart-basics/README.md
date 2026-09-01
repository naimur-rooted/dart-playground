#  Dart Basics

> **Topics:** Hello · Variables · Operators · Control Flow · Switch Menus ·
> Unit Conversions · User Input & Grading — explained line by line, with a
> comment on every single operation so anyone can understand.

A set of fully-commented **Dart** scripts that teach the core language
fundamentals through real, runnable examples.

| File                                  | Topics it teaches                                    |
| ------------------------------------- | ---------------------------------------------------- |
| `dart_basics.dart`                    | Hello, Variables, Nullability                        |
| `Control_Flow.dart`                   | Operators, if/else, switch, ternary, loops           |
| `Smart_Temperature_Converter.dart`    | Interactive menus, switch/case, unit conversions, `dart:io` input/output |
| `Student_Information_Grading_System.dart` | User input (`dart:io`), interpolation, `??`, grading system |

---

## 🚀 How to run

### 1. Install the Dart SDK (only once)

Download it from the official site:

```
https://dart.dev/get-dart
```

### 2. Create a Dart project (optional but recommended)

Inside an empty folder, run the Dart project wizard once:

```
dart create dart-basics
```

### 3. Run the examples

```bash
# Run the Hello / Variables / Nullability tour:
dart run dart_basics.dart

# Run the Operators / Control Flow tour:
dart run Control_Flow.dart

# Run the interactive Smart Temperature Converter:
dart run Smart_Temperature_Converter.dart

# Run the interactive Student Information & Grading System:
dart run Student_Information_Grading_System.dart
```

> 🔶 `Student_Information_Grading_System.dart` is **interactive** — it asks for
> student details and exam marks one by one, so run it from a terminal
> (it uses `dart:io`, which the web-based DartPad does not support).
>
> 🔶 `Smart_Temperature_Converter.dart` is also **interactive** — it presents a
> menu and reads temperatures from the terminal, so run it from a terminal
> (it uses `dart:io`, which the web-based DartPad does not support).
>
> 💡 No local SDK? Just paste a *non-interactive* file into the web
> playground: **https://dartpad.dev** and press **Run**.

---

## 📚 What this file teaches

| Section         | Concept covered                                          |
| --------------- | -------------------------------------------------------- |
| **Hello Dart**  | `print()` and string concatenation with `+`              |
| **Variables**   | Explicit types, reassignment, type safety, interpolation |
|                 | `var` (type inference) vs `dynamic` (untyped)            |
|                 | `final` (runtime constant) vs `const` (compile constant) |
| **Nullability** | `?` nullable types, `??`, `??=`, `?.`, `!`               |

---

## 🧠 Quick reference

### Hello
```dart
void main() {
  print('Hello, Dart!'); // print() writes text to the console
}
```

### Variables
```dart
String  name  = 'Taufiq';   // explicit type: text
int     age   = 27;         // explicit type: whole number
double  money = 1000.50;    // explicit type: decimal number
bool    isOk  = true;       // explicit type: true / false

var  school = 'CSE';        // Dart infers the type (String)
dynamic anything = 1;       // can change type freely (use sparingly)

final  country = 'Bangladesh'; // set once, at runtime
const  pi      = 3.1416;       // frozen at compile time
```

### Nullability
```dart
String? maybeName;              // '?' means the String may be null
String  fallback = maybeName ?? 'default'; // if null, use the default

int? score;
score ??= 10;                   // only assign when currently null

String? hello = 'Hi';
hello?.toUpperCase();           // safe call: only if not null

String sure = maybeName!;        // '!' forces a nullable as not-null (careful!)
```

---

## 🧠 Quick reference (Control_Flow.dart)

### Operators
```dart
int a = 10, b = 15;
print(a + b);    // + addition       -> 25
print(a % b);    // % remainder      -> 10
print(a >= b);   // >= comparison    -> false

bool hasTicket = false;
print(a >= 0 && hasTicket); // && both true  -> false
print(a >= 0 || hasTicket); // || one true   -> true
print(!hasTicket);          // !  flip       -> true

String? name = null;
String who = name ?? 'Guest'; // ?? default if null -> 'Guest'
```

### Decisions & loops
```dart
// if / else if / else
int marks = 85;
if (marks >= 90)      print('A+');
else if (marks >= 80) print('A');      // <- this runs
else                  print('below B');

// ternary picks one value
String status = (age >= 18) ? 'Adult' : 'Minor';

// switch picks one matching case
switch (day) {
  case 1: print('Monday'); break;
  default: print('Unknown');
}

// loops: while / do-while / for / for-in
while (i < 3) i++;
for (int k = 0; k < 3; k++) print(k);
for (var name in ['Nahid', 'Sabbir']) print(name);
// break  -> stop early,  continue -> skip a round
```

---

## 📚 What Smart_Temperature_Converter.dart teaches

| Section                | Concept covered                                                |
| ---------------------- | -------------------------------------------------------------- |
| **Interactive menu**   | Printing a menu and reading a numeric choice with `switch`/`case` |
| **User Input**         | `stdin.readLineSync()` + `int.parse()` / `double.parse()`        |
| **Unit Conversion**    | Applying math formulas (Celsius ↔ Fahrenheit ↔ Kelvin)         |
| **String Interpolation** | `$variable` and `${expression}` in output strings             |
| **Control Flow**       | `switch` with `break`, `default`, and `return` cases            |

## 🧠 Quick reference (Smart_Temperature_Converter.dart)

### Temperature conversion formulas

```dart
// Celsius -> Fahrenheit:  °F = (°C × 9/5) + 32
double fahrenheit = (celsius * 9 / 5) + 32;

// Fahrenheit -> Celsius:  °C = (°F − 32) × 5/9
double celsius = (fahrenheit - 32) * 5 / 9;

// Celsius -> Kelvin:  K = °C + 273.15
double kelvin = celsius + 273.15;

// Kelvin -> Celsius:  °C = K − 273.15
double celsius = kelvin - 273.15;
```

### Interactive switch menu

```dart
import 'dart:io';

print('1. Celsius to Fahrenheit');
print('2. Fahrenheit to Celsius');
print('3. Celsius to Kelvin');
print('4. Kelvin to Celsius');
print('5. Fahrenheit to Kelvin');
print('6. Kelvin to Fahrenheit');
print('7. Exit');

int choice = int.parse(stdin.readLineSync()!);

switch (choice) {
  case 1:
    print('Enter temperature in Celsius:');
    double celsius = double.parse(stdin.readLineSync()!);
    double fahrenheit = (celsius * 9 / 5) + 32;
    print('$celsius°C is equal to $fahrenheit°F');
    break;
  case 7:
    print('Exiting the program. Goodbye!');
    return;  // exits main() entirely
  default:
    print('Invalid option. Please select a number between 1 and 7.');
}
```

---

## 📚 What Student_Information_Grading_System.dart teaches

| Section             | Concept covered                                                  |
| ------------------- | ---------------------------------------------------------------- |
| **User Input**      | `stdout.write()` prompts + `stdin.readLineSync()` + `int.parse()` |
| **Interpolation**   | Printing a neat report card with `$var` and `${expression}`       |
| **Nullability**     | `String?` phone number + `?? 'Not Provided'` fallback             |
| **Grading**         | Percentage calculation + `if / else if / else` grade + pass/fail |

---

## 🧠 Quick reference (Student_Information_Grading_System.dart)

### Reading input

```dart
// dart:io is required for terminal input.
import 'dart:io';

stdout.write('Student Name: ');                  // no newline -> prompt stays on one line
String name = stdin.readLineSync()?.trim() ?? ''; // read a line of text, trim spaces
String ageLine = stdin.readLineSync()?.trim() ?? '';
int    age    = int.parse(ageLine);              // convert text into a number
```

### Optional phone number (nullable + ??)

```dart
String? phone = stdin.readLineSync()?.trim();     // may be null if skipped
print('Phone   : ${phone ?? 'Not Provided'}');    // ?? fallback when null
```

### Grade with if / else if / else

```dart
double percentage = (obtainedMarks / totalMarks) * 100;

if (percentage >= 80)      grade = 'A+';
else if (percentage >= 70) grade = 'A';
else if (percentage >= 60) grade = 'A-';
else if (percentage >= 50) grade = 'B';
else if (percentage >= 40) grade = 'C';
else if (percentage >= 33) grade = 'D';
else                       grade = 'F';

String result = (percentage >= 33) ? 'Passed' : 'Failed';
```

---

## 🤝 Contributing

Found a bug or a better example? Open an **issue** or send a **pull request** —
this is a learning repo, so contributions are always welcome.

---

## 📄 License

Free to use, modify, and learn from. No restrictions.
