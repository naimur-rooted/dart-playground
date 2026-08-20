// =====================================================================
//  DART BASICS
//  Topics: "Hello Dart" + Variables + Nullability
// =====================================================================
//  Every Dart program starts from the top-level `main()` function.
//  This file is fully commented so anyone can follow each step.

// `void main()` is the entry point — Dart always starts here.
void main() {
  // ---------------------------------------------------------------
  //  SECTION 1: HELLO DART  (printing to the console)
  // ---------------------------------------------------------------

  // print() writes its argument to the console, followed by a newline.
  print('Hello, Dart!');

  // Both single quotes and double quotes are valid for strings.
  print("Hello world — I'm learning Dart.");

  // Strings can be combined with the + operator (string concatenation).
  print('Welcome' + ' to Dart!');

  // ---------------------------------------------------------------
  //  SECTION 2: VARIABLES
  // A variable is a named box that stores a value.

  // ----- 2.1 Explicitly typed variables --------------------------
  // Dart is strongly typed. We can declare the type explicitly.
  String name = 'NAHID'; // String: a sequence of characters (text).
  int age = 24; // int: whole numbers.
  double salary = 1000.50; // double: numbers with a decimal point.
  bool isMerried = true; // bool: true or false.

  // Show the values on the console.
  print(name);
  print(age);
  print(salary);
  print(isMerried);

  // ----- 2.2 variables can change their VALUE ... ---------------
  // Reassigning a variable with the same type is allowed.
  name = 'Sabbir';
  age = 28;
  print('After reassignment: $name, $age');

  // ----- 2.3 ...but NEVER their TYPE (type safety) --------------
  // The lines below would cause a compile-time error. Try them!
  // name = 100;  // ERROR: can't put an int (100) into a String.
  // age = 'abc'; // ERROR: can't put a String ('abc') into an int.
  // Un-comment one of the lines above and see the error message.

  // ----- 2.4 String interpolation: embed variables in strings -----
  // "$var" inserts the value inside a string -- easier to read.
  print('Hi, my name is $name, I am $age years old.');

  // "${expression}" runs actual Dart code inside the string.
  // .toString() converts a number into text so it can be printed.
  print('You owe: ${salary.toString()} dollars.');

  // Addition happens inside ${...}, then the result is printed:
  print('Next year I will be ${age + 1} years old.');

  // ----- 2.5 var: let Dart INFER the type for you ----------------
  // `var` means: "I don't write the type; Dart figures it out."
  var school = 'CSE'; // Dart infers this is a String.
  var roll = 7; // Dart infers this is an int.
  print('I study $school. Roll no: $roll');

  // var variables are still type-safe: the inferred type can't change.
  // roll = 'seven'; // ERROR: 'seven' is a String, roll is an int.

  // ----- 2.6 dynamic: all bets are off (use sparingly!) ----------
  // dynamic disables type safety: the variable can hold anything.
  dynamic anything = 'I am a String'; // starts life as a String...
  print(anything);

  anything = 42; // ...now an int...
  print(anything);

  anything = true; // ...now a bool. No error, but no protection either.
  print(anything);

  // ----- 2.7 final: assign once, at RUNTIME ----------------------
  // final = single-assignment: you can only set the value once.
  final country; // declared without a value — it will be set below.
  country = 'Bangladesh'; // first (and only) assignment: OK.
  // country = 'Japan'; // ERROR: a final variable can be set only once!
  print('Country: $country');

  // final also stores values computed while the program is running:
  final now = DateTime.now(); // the current date & time at run time.
  print('This program ran at: $now');

  // ----- 2.8 const: frozen at COMPILE time, forever --------------
  // const = a compile-time constant: known before the program runs.
  const pi = 3.1416; // Conventional for constants: all lowercase pi.
  const String greeting = 'Hello'; // const works with explicit type too.
  print('$greeting, pi = $pi');

  // final vs const in one sentence:
  //   const -> value known BEFORE the program runs (e.g. pi = 3.1416).
  //   final -> value known only WHILE it runs (e.g. DateTime.now()).
  //   That is why this line is illegal:
  //   const x = DateTime.now();

  // ---------------------------------------------------------------
  //  SECTION 3: NULLABILITY (Null Safety)
  // ---------------------------------------------------------------
  // Dart is null-safe: by default a variable can NEVER hold null.

  // Declared-but-not-initialized String is "non-nullable":
  String importantMessage; // declared with NO starting value.
  // print(importantMessage); // ⚠️ Un-comment -> ERROR: read before set.
  // That is because non-nullable variables MUST get a value first.

  // Adding ? to the type means "this may be null":
  String? maybeName; // `String?` = "the String might currently be null".
  print('maybeName is: $maybeName'); // prints "null" — totally legal.

  // Primitive types can also become nullable with '?':
  int? nullableAge; // Nullable int -> starts life as null.
  print('Age: $nullableAge'); // prints "null" — no error.

  // ----- 3.1 ?? — the null-coalescing operator ----------------
  // "If the left side is null, fall back to the right side."
  String? nickName; // nullable String, currently null.
  String displayName = nickName ?? 'No nickname'; // default fallback.
  print('Nick name: $displayName'); // No nickname

  nickName = 'Ringo';
  print('Now it is: ${nickName ?? "No nickname"}'); // uses left value.

  // ----- 3.2 ??= — assign only when the variable is null ------
  int? score; // nullable int, initialized to null.
  score ??= 10; // score is null, so assign 10.
  score ??= 99; // score is NOT null now, so this line does nothing.
  print('score = $score'); // 10 (not 99).

  // ----- 3.3 ?. — safe access on a nullable value -----------
  String? maybeHello = 'Hello';
  // ?. runs .toUpperCase() ONLY when the value is not null:
  print(maybeHello?.toUpperCase() ?? 'was null'); // HELLO

  String? maybeNull = null;
  print(maybeNull?.toUpperCase() ?? 'was null'); // was null

  // ----- 3.4 ! — the null assertion operator ---------------
  // ! means: "Trust me, this nullable is really not null."
  // Only use it when you are 100% sure; abusing it can crash the app.
  String nameWithValue = 'Dart Basics';
  int nameLength = nameWithValue.length; // valid & safe.
  print('Length of "$nameWithValue": $nameLength');

  // String? danger = null;
  // String sure = danger!; // 💥 would throw a NullError at runtime.

  print('== You finished the Dart basics tour! ==');
}