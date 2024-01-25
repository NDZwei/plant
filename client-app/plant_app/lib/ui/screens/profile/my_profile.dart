import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My profile page'),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
