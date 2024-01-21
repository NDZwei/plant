import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

import '../../models/plant.dart';

class DetailPage extends StatefulWidget {
  final int plantId;

  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Constants.primaryColor.withOpacity(0.15)),
                      child: Icon(
                        Icons.close,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('favorite');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Constants.primaryColor.withOpacity(0.15)),
                      child: Icon(
                        _plantList[widget.plantId].isFavorite == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.8,
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 0,
                      child: SizedBox(
                        height: 320,
                        child: Image.asset(_plantList[widget.plantId].imageURL),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        right: 0,
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PlantFeature(
                                title: 'Size',
                                plantFeature: _plantList[widget.plantId].size,
                              ),
                              PlantFeature(
                                title: 'Humidity',
                                plantFeature: _plantList[widget.plantId]
                                    .humidity
                                    .toString(),
                              ),
                              PlantFeature(
                                title: 'Temperature',
                                plantFeature:
                                    _plantList[widget.plantId].temperature,
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _plantList[widget.plantId].plantName,
                            style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            r'$' + _plantList[widget.plantId].price.toString(),
                            style: TextStyle(
                              color: Constants.blackColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _plantList[widget.plantId].rating.toString(),
                            style: TextStyle(
                              fontSize: 24,
                              color: Constants.primaryColor,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 24,
                            color: Constants.primaryColor,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                      child: Text(
                    _plantList[widget.plantId].description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      height: 1.5,
                      color: Constants.blackColor.withOpacity(0.7),
                      fontSize: 18,
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Icon(Icons.shopping_cart, color: Colors.white,),
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(0.3) 
                  )
                ]
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: Constants.primaryColor.withOpacity(0.3)
                  )
                ]
              ),
              child: const Center(
                child: Text('Buy now', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
              ),
            ))
          ],
        ),
      ) ,
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;

  const PlantFeature({
    super.key,
    required this.plantFeature,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Constants.blackColor),
        ),
        Text(
          plantFeature,
          style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ],
    );
  }
}
