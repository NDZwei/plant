import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

import '../../models/plant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _planList = Plant.plantList;

    List<String> _plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement'
    ];

    bool toggleIsFavorite(bool isFavorite) {
      return !isFavorite;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: size.width * 0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      const Expanded(
                          child: TextField(
                        showCursor: false,
                        decoration: InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      )),
                      Icon(
                        Icons.mic,
                        color: Colors.black54.withOpacity(0.4),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 50,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                            color: selectedIndex == index
                                ? Constants.primaryColor
                                : Constants.blackColor),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
                itemCount: _planList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                onPressed: null,
                                icon: Icon(_planList[index].isFavorite == true
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                                color: Constants.primaryColor,
                                iconSize: 30,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            )),
                        Positioned(
                          left: 50,
                          right: 50,
                          top: 50,
                          bottom: 50,
                          child: Image.asset(_planList[index].imageURL),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _planList[index].category,
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 16),
                              ),
                              Text(
                                _planList[index].plantName,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                '\$${_planList[index].price.toString()}',
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16),
                              ),
                            ))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20)),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: Text(
              'New plants',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: size.height * 0.5,
            child: ListView.builder(
                itemCount: _planList.length,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    height: 80,
                    padding: EdgeInsets.only(left: 10, top: 10),
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color:
                                      Constants.primaryColor.withOpacity(0.8),
                                  shape: BoxShape.circle),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 0,
                              right: 0,
                              child: SizedBox(
                                height: 80,
                                child: Image.asset(_planList[index].imageURL),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_planList[index].category),
                                  Text(
                                    _planList[index].plantName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Constants.blackColor),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text('\$${_planList[index].price.toString()}', style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor, fontSize: 16),),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
