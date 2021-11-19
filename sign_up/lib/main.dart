import 'package:flutter/material.dart';
import 'package:sign_up/pages/sign_up.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sign Up',
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
