import 'dart:io';

void main() {
  print("Welcome to the Smart Temperature Converter!");

  print(
    "1. Celsius to Fahrenheit \n2. Fahrenheit to Celsius \n3. Celsius to Kelvin\n4. Kelvin to Celsius\n5. Fahrenheit to Kelvin\n6. Kelvin to Fahrenheit\n7. Exit",
  );

  print("Please select an option (1-7):");
  int choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      print("Enter temperature in Celsius:");
      double celsius = double.parse(stdin.readLineSync()!);
      double fahrenheit = (celsius * 9 / 5) + 32;
      print("$celsius°C is equal to $fahrenheit°F");
      break;

    case 2:
      print("Enter temperature in Fahrenheit:");
      double fahrenheitInput = double.parse(stdin.readLineSync()!);
      double celsiusOutput = (fahrenheitInput - 32) * 5 / 9;
      print("$fahrenheitInput°F is equal to $celsiusOutput°C");
      break;

    case 3:
      print("Enter temperature in Celsius:");
      double celsiusToKelvin = double.parse(stdin.readLineSync()!);
      double kelvin = celsiusToKelvin + 273.15;
      print("$celsiusToKelvin°C is equal to $kelvin K");
      break;

    case 4:
      print("Enter temperature in Kelvin:");
      double kelvinInput = double.parse(stdin.readLineSync()!);
      double celsiusFromKelvin = kelvinInput - 273.15;
      print("$kelvinInput K is equal to $celsiusFromKelvin°C");
      break;

    case 5:
      print("Enter temperature in Fahrenheit:");
      double fahrenheitToKelvin = double.parse(stdin.readLineSync()!);
      double kelvinFromFahrenheit = (fahrenheitToKelvin - 32) * 5 / 9 + 273.15;
      print("$fahrenheitToKelvin°F is equal to $kelvinFromFahrenheit K");
      break;

    case 6:
      print("Enter temperature in Kelvin:");
      double kelvinToFahrenheit = double.parse(stdin.readLineSync()!);
      double fahrenheitFromKelvin = (kelvinToFahrenheit - 273.15) * 9 / 5 + 32;
      print("$kelvinToFahrenheit K is equal to $fahrenheitFromKelvin°F");
      break;

    case 7:
      print("Exiting the program. Goodbye!");
      return;

    default:
      print("Invalid option. Please select a number between 1 and 7.");
  }
}
