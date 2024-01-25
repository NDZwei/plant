import 'package:flutter/material.dart';
import 'package:plant_app/ui/screens/widgets/PlantWiget.dart';

import '../../constants.dart';
import '../../models/plant.dart';

class CartPage extends StatefulWidget {
  final List<Plant> cardPlants;
  const CartPage({super.key, required this.cardPlants});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double calculateTotalPrice() {
    double total = 0;
    for (Plant plant in widget.cardPlants) {
      total += plant.price;
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.cardPlants.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/add-cart.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your cart',
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    )
                  ],
                ),
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                height: size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.cardPlants.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return PlantWidget(
                              index: index, plantList: widget.cardPlants);
                        },
                      ),
                    ),
                    Column(
                      children: [
                        const Divider(
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Totals',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '\$${calculateTotalPrice().toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Constants.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ));
  }
}
