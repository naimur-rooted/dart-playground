abstract class Appliance {
  void turnOn();
  void turnOff();
}

class Fan extends Appliance {
  void turnOn() {
    print("Fan is now running.");
  }

  void turnOff() {
    print("Fan has been swiched off");
  }
}

class Light extends Appliance {
  void turnOn() {
    print("Light is switched on");
  }

  void turnOff() {
    print("Light is switched off");
  }
}

void main() {
  Fan fan = Fan();
  print("Fan Actions");
  fan.turnOn();
  fan.turnOff();

  Light light = Light();
  print("\nLight Actions");
  light.turnOn();
  light.turnOff();
}
