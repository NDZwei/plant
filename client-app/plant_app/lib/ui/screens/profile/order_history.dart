import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order history page'),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
