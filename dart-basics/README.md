#  Dart Basics

> **Topics:** Hello Dart · Variables · Nullability — explained line by line,
> with a comment on every single operation so anyone can understand the facts.

A single, fully-commented **Dart** script that teaches the core language
fundamentals through real, runnable examples.

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

### 3. Run this file

```bash
dart run dart_basics.dart
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

## 🤝 Contributing

Found a bug or a better example? Open an **issue** or send a **pull request** —
this is a learning repo, so contributions are always welcome.

---

## 📄 License

Free to use, modify, and learn from. No restrictions.