// =====================================================================
//  DART CONTROL FLOW & OPERATORS
//  Topics: Operators (math / compare / logical) + Decisions
//          (if, switch, ternary) + Loops (while, for, break...)
// =====================================================================
//  Every operation is commented so anyone can follow exactly what
//  each line does. This pairs with dart_basics.dart in the same folder.
//
//  RUN:   dart run Control_Flow.dart
//  (or paste it into https://dartpad.dev and press Run)

void main() {
  // ---------------------------------------------------------------
  //  SECTION 1: ARITHMETIC OPERATORS ( +  -  *  /  % )
  // ---------------------------------------------------------------
  // Numbers can be combined with math operators.
  int a = 10;
  int b = 15;

  // + means addition: 10 + 15 = 25.
  print(a + b);

  // - means subtraction: 10 - 15 = -5 (negatives are allowed).
  print(a - b);

  // * means multiplication: 10 * 15 = 150.
  print(a * b);

  // / means division: 10 / 15 = 0.666... (result is a decimal).
  print(a / b);

  // % means modulo: it returns the REMAINDER of a division.
  print(a % b); // 10 % 15 = 10 (10 goes into 15 zero times, 10 left)
  print(b % a); // 15 % 10 = 5  (15 divided by 10 leaves a remainder of 5)

  // ---------------------------------------------------------------
  //  SECTION 2: INCREMENT (++) & DECREMENT (--) OPERATORS
  // ---------------------------------------------------------------
  // ++ adds 1 to a number.  -- subtracts 1 from a number.
  int count = 5;

  // POST-increment (count++): use the CURRENT value, THEN add 1.
  print(count++); // prints 5 (the old value), then count becomes 6.
  print(count); // now count is 6.

  // PRE-increment (++count): add 1 FIRST, then use the new value.
  print(++count); // count becomes 7, then prints 7.
  print(count); // now count is 7.

  // POST-decrement (count--): use the current value, THEN subtract 1.
  print(count--); // prints 7, then count becomes 6.
  print(count); // now count is 6.

  // PRE-decrement (--count): subtract 1 FIRST, then use the new value.
  print(--count); // count becomes 5, then prints 5.

  // ---------------------------------------------------------------
  //  SECTION 3: RELATIONAL (COMPARISON) OPERATORS
  // ---------------------------------------------------------------
  // Relations compare two values. Every one returns a bool (true/false).
  //   ==  equal                 !=  not equal
  //   >   greater than          <   less than
  //   >=  greater than or equal <=  less than or equal
  int age = 25; // we will compare against the number 25.

  print(age == 25); // true,  25 equals 25.
  print(age != 25); // false, 25 does NOT differ from 25.
  print(age > 17); // true,  25 is greater than 17.
  print(age < 17); // false, 25 is not less than 17.
  print(age >= 25); // true,  25 is greater than OR equal to 25.
  print(age <= 20); // false, 25 is not less than or equal to 20.

  // ---------------------------------------------------------------
  //  SECTION 4: LOGICAL OPERATORS (&&  ||  !)
  // ---------------------------------------------------------------
  bool hasTicket = false; // a sample condition.

  // && (AND): BOTH sides must be true for the result to be true.
  print(age >= 18 && hasTicket); // true && false -> false.

  // || (OR): AT LEAST ONE side must be true for the result to be true.
  print(age >= 18 || hasTicket); // true || false -> true.

  // ! (NOT): flips a true to false and a false to true.
  print(!hasTicket); // !false -> true.
  print(!(age >= 18)); // !true -> false.

  // ---------------------------------------------------------------
  //  SECTION 5: NULL-AWARE OPERATORS (??  ??=)
  // ---------------------------------------------------------------
  // These handle "maybe empty" values, exactly like in dart_basics.dart.

  String? name = null;         // nullable String, no value yet.
  print('name currently: $name'); // null

  // ?? (null-coalesce) picks the RIGHT value when the LEFT is null.
  // This is the classic "give it a default if it is empty" pattern.
  String fallbackName = name ?? 'Guest'; // name is null -> 'Guest'.
  print('Hello $fallbackName'); // Hello Guest

  name = 'Nahid';              // now it holds a real value.
  print('Hello $name');       // Hello Nahid

  // ??= assigns ONLY when the variable is currently null.
  int? score;                   // nullable int, starts as null.
  score ??= 100; // score is null -> becomes 100.
  print('Score: $score'); // Score: 100

  // ---------------------------------------------------------------
  //  SECTION 6: DECISIONS — if / else if / else
  // ---------------------------------------------------------------
  // if(condition): run the block ONLY when the condition is true.
  age = 16; // change the value, then re-check the same condition.

  if (age >= 18) {
    print('Able to vote'); // runs only when age >= 18.
  } else {
    print('Still a kid'); // runs only when the if-condition was false.
  }

  // else if lets you test MANY conditions, top to bottom.
  int marks = 85; // exam score, out of 100.

  if (marks >= 90) {
    print('Grade: A+');
  } else if (marks >= 80) {
    print('Grade: A'); // 85 >= 80 is true, so THIS branch runs.
  } else if (marks >= 70) {
    print('Grade: B');
  } else {
    print('Grade: below B'); // catches everything else.
  }

  // Ternary (? :) is a one-line mini if/else that PICKS a value.
  //   condition ? valueWhenTrue : valueWhenFalse
  age = 20;
  String status = (age >= 18) ? 'Adult' : 'Minor'; // true -> 'Adult'.
  print('$age -> $status'); // 20 -> Adult

  // ---------------------------------------------------------------
  //  SECTION 7: SWITCH — match ONE value against many cases
  // ---------------------------------------------------------------
  int day = 3; // pretend it is "day 3" of the week.

  switch (day) {
    case 1:
      print('Monday');
      break; // break exits the switch after a case matched.
    case 2:
      print('Tuesday');
      break;
    case 3:
      print('Wednesday'); // day == 3, so this case runs.
      break;
    default:
      print('Unknown day'); // only runs if NO case matched.
  }

  // ---------------------------------------------------------------
  //  SECTION 8: LOOPS — repeat a block of code
  // ---------------------------------------------------------------

  // while: repeat while the condition stays true.
  int i = 0;
  while (i < 3) {
    print('while loop, i = $i');
    i++; // CRITICAL: update i, or this loop would run forever.
  }

  // do-while: run the body FIRST, then check the condition.
  // This guarantees the body runs AT LEAST once.
  int j = 5;
  do {
    print('do-while body ran once, j = $j');
    j++;
  } while (j < 5); // 5 < 5 is false, but the body already ran once.

  // for: (start; condition; update) all on one line.
  for (int k = 0; k < 3; k++) {
    print('for loop, k = $k');
  }

  // for-in: walk through each item of a collection, like a List.
  var names = ['Nahid', 'Sabbir', 'Taufiq']; // List of three Strings.
  for (var entry in names) {
    print('for..in -> $entry'); // runs once per name.
  }

  // break: jump OUT of a loop early.
  for (int m = 0; m < 10; m++) {
    if (m == 3) {
      break; // stop the whole loop as soon as m hits 3.
    }
    print('break test, m = $m'); // prints 0, 1, 2, then the loop stops.
  }

  // continue: SKIP this one round and move to the next.
  for (int n = 0; n < 5; n++) {
    if (n == 3) {
      continue; // skip printing ONLY when n is 3.
    }
    print('continue test, n = $n'); // prints 0,1,2,4 (3 was skipped).
  }

  print('== Control flow tour finished! ==');
}