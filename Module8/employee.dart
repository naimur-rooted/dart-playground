// Base class Employee with common properties
class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);

  void displayInfo() {
    print("Name:$name");
    print("Salary:\$$salary");
  }
}

// Manager subclass adds department property
class Manager extends Employee {
  String department;
  Manager(String name, double salary, this.department) : super(name, salary);

  void displayInfo() {
    super.displayInfo(); // call Employee's displayInfo
    print("Department:$department");
  }
}

// Developer subclass adds programmingLanguage property
class Developer extends Employee {
  String programmingLanguage;

  Developer(String name, double salary, this.programmingLanguage)
    : super(name, salary);

  void displayInfo() {
    super.displayInfo(); // call Employee's displayInfo
    print("Programming Language:$programmingLanguage");
  }
}

void main() {
  // Manager object
  Manager manager = Manager("Nahid", 6000.00, "HR");
  print("Manager Details:");
  manager.displayInfo();

  //Developer object
  Developer developer = Developer("Riad", 4000.00, "Dart");
  print("\nDeveloper Details:");
  developer.displayInfo();
}
