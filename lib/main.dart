import 'package:flutter/material.dart';
import 'package:form_test_task/screens/phone_number_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneNumberScreen(),
    );
  }
}
