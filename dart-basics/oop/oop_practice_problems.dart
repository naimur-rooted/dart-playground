// OOP Practice Problems
// Problem 1: Class, Constructor & Method -> Book
// Problem 2: Inheritance                 -> Employee / Manager / Developer
// Problem 3: Abstract Class              -> Appliance / Fan / Light

void main() {
  // ================= Problem 1: Book Class =================
  print('===== Problem 1: Book Class =====');

  // Create at least two Book objects
  Book book1 = Book(
    title: 'Clean Code',
    author: 'Robert C. Martin',
    price: 800,
  );

  Book book2 = Book(
    title: 'Dart for Beginners',
    author: 'Kazi Nasir',
    price: 550,
  );

  // Print their details along with discounted prices
  book1.displayDetails(10);
  print('');
  book2.displayDetails(25);
  print('');

  // ============ Problem 2: Employee Inheritance ============
  print('===== Problem 2: Employee Inheritance =====');

  // Create one Manager and one Developer object
  Manager manager = Manager(name: 'Rahim', salary: 90000, department: 'Sales');

  Developer developer = Developer(
    name: 'Karim',
    salary: 60000,
    programmingLanguage: 'Dart',
  );

  // Display their details
  manager.displayInfo();
  print('');
  developer.displayInfo();
  print('');

  // ============ Problem 3: Abstract Class (Appliance) ============
  print('===== Problem 3: Abstract Class (Appliance) =====');

  // Create one Fan and one Light object, then call their methods
  Fan fan = Fan();
  Light light = Light();

  fan.turnOn();
  fan.turnOff();
  print('');
  light.turnOn();
  light.turnOff();
}

// ================= Problem 1: Book =================
class Book {
  // Properties
  String title;
  String author;
  double price;

  // Constructor
  Book({required this.title, required this.author, required this.price});

  // Calculates and returns the price after applying the discount
  double discountedPrice(double discountPercent) {
    // A discount must stay between 0% and 100%
    if (discountPercent < 0 || discountPercent > 100) {
      print('Discount must be between 0 and 100. Returning original price.');
      return price;
    }
    double discountAmount = price * discountPercent / 100;
    return price - discountAmount;
  }

  // Displays book details along with the discounted price
  void displayDetails(double discountPercent) {
    print('Book Details:');
    print('  Title: $title');
    print('  Author: $author');
    print('  Price: $price');
    print(
      '  Discounted Price ($discountPercent% off): '
      '${discountedPrice(discountPercent).toStringAsFixed(2)}',
    );
  }
}

// ============ Problem 2: Employee Inheritance ============

// Base class
class Employee {
  // Properties
  String name;
  double salary;

  // Constructor
  Employee({required this.name, required this.salary});
}

// Subclass: Manager adds its own 'department' property
class Manager extends Employee {
  // Additional property
  String department;

  // Constructor: initializes its own property and forwards the rest to super
  Manager({
    required String name,
    required double salary,
    required this.department,
  }) : super(name: name, salary: salary);

  // Displays complete manager information
  void displayInfo() {
    print('Manager Details:');
    print('  Name: $name');
    print('  Salary: $salary');
    print('  Department: $department');
  }
}

// Subclass: Developer adds its own 'programmingLanguage' property
class Developer extends Employee {
  // Additional property
  String programmingLanguage;

  // Constructor: initializes its own property and forwards the rest to super
  Developer({
    required String name,
    required double salary,
    required this.programmingLanguage,
  }) : super(name: name, salary: salary);

  // Displays complete developer information
  void displayInfo() {
    print('Developer Details:');
    print('  Name: $name');
    print('  Salary: $salary');
    print('  Programming Language: $programmingLanguage');
  }
}

// ============ Problem 3: Abstract Class (Appliance) ============

// Abstract class: cannot be instantiated directly.
// It only defines WHAT every appliance must be able to do (the contract).
abstract class Appliance {
  // Abstract methods: no body here, subclasses MUST implement them
  void turnOn();

  void turnOff();
}

// Subclass: Fan implements the abstract methods with its own messages
class Fan extends Appliance {
  @override
  void turnOn() {
    print('Fan is now running');
  }

  @override
  void turnOff() {
    print('Fan has been switched off');
  }
}

// Subclass: Light implements the abstract methods with its own messages
class Light extends Appliance {
  @override
  void turnOn() {
    print('Light is switched on');
  }

  @override
  void turnOff() {
    print('Light is switched off');
  }
}
