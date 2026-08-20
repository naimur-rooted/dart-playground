#  Dart Basics

> **Topics:** Hello · Variables · Operators · Control Flow — explained line by
> line, with a comment on every single operation so anyone can understand.

A set of fully-commented **Dart** scripts that teach the core language
fundamentals through real, runnable examples.

| File                    | Topics it teaches                             |
| ----------------------- | --------------------------------------------- |
| `dart_basics.dart`      | Hello, Variables, Nullability                 |
| `Control_Flow.dart`     | Operators, if/else, switch, ternary, loops    |

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
```

> 💡 No local SDK? Just paste the file into the web playground:
> **https://dartpad.dev** and press **Run**.

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

## 🤝 Contributing

Found a bug or a better example? Open an **issue** or send a **pull request** —
this is a learning repo, so contributions are always welcome.

---

## 📄 License

Free to use, modify, and learn from. No restrictions.
