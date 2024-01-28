import 'package:flutter/material.dart';
import 'package:plant_app/ui/screens/auth/login_page.dart';
import 'package:plant_app/ui/screens/profile/location.dart';
import 'package:plant_app/ui/screens/profile/my_profile.dart';
import 'package:plant_app/ui/screens/profile/order_history.dart';
import 'package:plant_app/ui/screens/profile/wallet.dart';
import 'package:plant_app/ui/screens/widgets/profile_widget.dart';

import '../../constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(.5),
                    width: 5.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .3,
                child: Row(
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: Image.asset("assets/images/verified.png"),
                    ),
                  ],
                ),
              ),
              Text(
                'johndoe@gmail.com',
                style: TextStyle(
                  color: Constants.blackColor.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ProfileWidget(
                      icon: Icons.person,
                      title: 'My Profile',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyProfile()),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.account_balance_wallet,
                      title: 'Wallet balance',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Wallet()),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.shopping_cart,
                      title: 'Order',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrderHistory()),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.location_pin,
                      title: 'Location',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Location()),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.logout,
                      title: 'Log Out',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
