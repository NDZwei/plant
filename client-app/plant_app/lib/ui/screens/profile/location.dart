import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location page'),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
