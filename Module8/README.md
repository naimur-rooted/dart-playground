# Module 8 – Dart Assignments

This folder contains solutions for **Module 8** assignments, focusing on Object-Oriented Programming (OOP) concepts in Dart.  
Each problem demonstrates a different principle such as classes, inheritance, abstraction, and method overriding.

---

## Files Included

### 1. `book_example.dart`
- Defines a `Book` class with properties: `title`, `author`, and `price`.
- Includes a method to calculate discounted price.
- Demonstrates object instantiation and method calls with two book objects.

### 2. `employee.dart`
- Base class: `Employee` with properties `name` and `salary`.
- Subclasses:
  - `Manager` → adds `department`.
  - `Developer` → adds `programmingLanguage`.
- Both override `displayInfo()` using `super.displayInfo()` to extend functionality.

### 3. `appliance.dart`
- Abstract class: `Appliance` with abstract methods `turnOn()` and `turnOff()`.
- Subclasses:
  - `Fan` → implements methods with custom messages.
  - `Light` → implements methods with custom messages.
- Demonstrates abstraction and implementation of abstract methods.

---

## Concepts Covered
- **Classes & Objects** → Defining properties and methods.
- **Constructors** → Initializing objects with parameters.
- **Inheritance** → Sharing properties and methods across subclasses.
- **Method Overriding** → Extending parent class functionality using `super`.
- **Abstraction** → Using abstract classes and enforcing method implementation.