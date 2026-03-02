main() {
  String fullname = 'Md. Naimur Rahman';
  String fullname2 = 'Nahid';
  int age = 24;
  double sallery = 50.55;
  bool islogin = true;

  //concatenation
  String fullname3 = ("$fullname $fullname2 ");
  print("Name:$fullname3 \nAge:$age \nSallery:$sallery");
  print("Login Stutus:$islogin");

  var test = 'Free Palestine';
  print(test);
  test = 'Nahid';

  dynamic test2 = 50.50;
  test2 = 'Nahid';
  print(test2);
}
