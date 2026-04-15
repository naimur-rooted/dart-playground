class Student {
  Student(this.name, this.studentId, this.gpa);
  Student.freshman(this.name, this.studentId) : gpa = 0.0;

  String name;
  String studentId;
  double gpa;

  void printStudentInfo() {
    print("Student name: $name");
    print("Student ID: $studentId");
    print("Student GPA: $gpa");
  }
}

void main() {
  final starStudent = Student('Jane Doe', 'S123', 3.9);
  starStudent.printStudentInfo();

  final freshman = Student.freshman('John Smith', 'S124');
  freshman.printStudentInfo();
}
