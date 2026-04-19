class Thermostat {
  // Private field
  double _temperature;

  // Constructor
  Thermostat(this._temperature);

  // Getter for Celsius
  double get celsius => _temperature;

  // Setter for Celsius with validation
  set celsius(double value) {
    if (value >= -30 && value <= 50) {
      _temperature = value;
    } else {
      print("Warning: Temperature out of range");
    }
  }

  // Bonus: Getter for Fahrenheit
  double get fahrenheit => (_temperature * 9 / 5) + 32;
}

void main() {
  // Initialize thermostat
  Thermostat t = Thermostat(25);

  // Access temperature
  print("Temperature in Celsius: ${t.celsius}");
  print("Temperature in Fahrenheit: ${t.fahrenheit}");

  //setting a valid temperature
  t.celsius = 40;
  print("Updated Celsius: ${t.celsius}");

  // Try setting an invalid temperature
  t.celsius = 100; // Will trigger warning
}
