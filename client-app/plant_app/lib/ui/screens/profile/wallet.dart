import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
