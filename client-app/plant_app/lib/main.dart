import 'package:flutter/material.dart';
import 'package:plant_app/ui/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'On boarding screen',
      home: OnBoarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
