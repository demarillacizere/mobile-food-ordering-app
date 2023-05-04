import 'package:flutter/material.dart';
import 'package:food_app/cart_page.dart';
import 'package:food_app/home_page.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/restaurants.dart';
import 'package:food_app/order_page.dart';
import 'package:food_app/screens/home/widget/restaurant_info.dart';

import '../../../notification_page.dart';
import '../../../settings.dart';
import '../../../widgets/custom_app_bar.dart';
import 'food_list.dart';
import 'food_list_view.dart';

class MenuScreen extends StatefulWidget {
  final String restaurant;

  const MenuScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    var selected = 0;
    final pageController = PageController();
    
    return Scaffold(  
       
      backgroundColor: const Color(0xFFFFF7DD),   
      body: Column(
        children: [
          CustomAppBar(
            Icons.arrow_back_ios_new_outlined,
            Icons.notifications,
            () => Navigator.pop(context),
            itemBuilder: (context, index) {
              return const Card(
                margin: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              );
            },
          ),
          // RestaurantInfo(restaurant: widget.restaurant),
        //   FoodList(selected, (index) {
        //   setState(() {
        //     selected = index;
        //   });
        //   pageController.animateToPage(index,
        //       duration: const Duration(milliseconds: 300),
        //       curve: Curves.easeIn);
        // }, widget.restaurant),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          switch (index) {
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountSettingPage()));
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: 'Shopping Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black),
            label: 'Settings',
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(addToCart: (Food ) {  }, cartItems: [],   ) ));
      //   },
      //   backgroundColor: Colors.red,
      //   child: Icon(Icons.shopping_cart),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    
    );
  }
}
