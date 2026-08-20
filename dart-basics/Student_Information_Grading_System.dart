
import 'dart:io';

void main() {

  //  PART 1: STUDENT INFORMATION
  stdout.write('Student Name: ');
  String studentName = stdin.readLineSync() ?? '';

  stdout.write('Age: ');
  String ageLine = stdin.readLineSync()??'';
  int age = int.parse(ageLine);      //turning user‑typed text into a real integer

  stdout.write('Student ID: ');
  String studentId = stdin.readLineSync() ?? '';

  stdout.write('Email: ');
  String email = stdin.readLineSync() ?? '';

  stdout.write('Phone Number (optional, press Enter to skip): ');
  String? phoneNumber = stdin.readLineSync()?.trim();

  if (phoneNumber != null && phoneNumber.isEmpty) {
    phoneNumber = null;
  }

  // Print the collected information neatly using interpolation.
  print('');
  print('-------------- STUDENT INFORMATION --------------');
  print('Name    : $studentName');
  print('Age     : $age');
  print('ID      : $studentId');
  print('Email   : $email');

  // Phone is nullable. The ?? operator picks the right side only when
  // the left side is null. So if no phone was typed, we print a fallback.
  print('Phone   : ${phoneNumber ?? 'Not Provided'}');
  print('-----------------------------------------------');


  //  PART 2: GRADING SYSTEM

  stdout.write('\nEnter Total Marks: ');
  String totalLine = stdin.readLineSync() ?? '';
  int totalMarks = int.parse(totalLine);

  // The marks the student actually obtained.
  stdout.write('Enter Obtained Marks: ');
  String obtainedLine = stdin.readLineSync() ?? '';
  int obtainedMarks = int.parse(obtainedLine);


  double percentage = (obtainedMarks / totalMarks) * 100;

  print('\n----------------------------------------');
  print('Result Report');
  print('----------------------------------------');
  print('Total Marks     : $totalMarks');
  print('Obtained Marks  : $obtainedMarks');
  print('Percentage      : ${percentage.toStringAsFixed(2)}%');
  print('----------------------------------------');


  String grade; //this grade will store the update grade

  if (percentage >= 80) {
    grade = 'A+';
  } else if (percentage >= 70) {
    grade = 'A';
  } else if (percentage >= 60) {
    grade = 'A-';
  } else if (percentage >= 50) {
    grade = 'B';
  } else if (percentage >= 40) {
    grade = 'C';
  } else if (percentage >= 33) {
    grade = 'D';
  } else {
    grade = 'F';
  }

  // A student passes when the percentage is 33% or more.
  String status = (percentage >= 33) ? 'Passed' : 'Failed';

  print('Grade  : $grade');
  print('Result : $status');
  print('----------------------------------------');
}
