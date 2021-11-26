import 'package:flutter/material.dart';
import './pages/assignment/assignment_2.dart';
import './pages/assignment/assignment_3.dart';
import './pages/assignment/assignment_4.dart';
import './pages/assignment/assignment_5.dart';

void main() {
  const arg = String.fromEnvironment("assignment"); // run: flutter run --dart-define="assignment=N"
  Widget app = const Text("no assignment", textDirection: TextDirection.ltr);
  if (arg == "2") {
    app = const Assignment2();
  } else if (arg == "3") {
    app = const Assignment3();
  } else if (arg == "4") {
    app = const Assignment4();
  } else if (arg == "5") {
    app = const Assignment5();
  }
  runApp(app);
}
