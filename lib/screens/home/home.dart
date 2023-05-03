import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_app/cart_provider.dart';
// import 'package:food_app/models/restaurants.dart';
import 'package:food_app/screens/home/widget/food_list.dart';
import 'package:food_app/screens/home/widget/food_list_view.dart';
import 'package:food_app/screens/home/widget/menu.dart';
import 'package:food_app/screens/home/widget/restaurant_info.dart';
import 'package:food_app/screens/home/widget/restaurant_list_view.dart';

import '../../cart_page.dart';
import '../../home_page.dart';
// import '../../models/restaurants.dart';
import '../../notification_page.dart';
import '../../order_page.dart';
import '../../settings.dart';
import '../../widgets/custom_app_bar.dart';
import 'food_details_page.dart';

class HomePage extends StatefulWidget {
  final String restId;
  const HomePage({super.key, required this.restId});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  var inde = 0;
  final pageController = PageController();
  String? restName;
  String? restLabel;
  String? restMenu;
  String? restScore;

  getData() async {
    DocumentSnapshot restData = await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(widget.restId)
        .get() as DocumentSnapshot;

    setState(() {
      restName = restData.get('name');
      restLabel = restData.get('label');
      restScore = restData.get('score');
    });
  }

  @override
  void initState() {
    getData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7DD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomAppBar(
            Icons.arrow_back_ios_new_outlined,
            Icons.notifications,
            () => Navigator.pop(context),
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'What would you like to eat?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width - 32,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(restName!),

          RestaurantInfo(restaurant: widget.restId, score: '4'),
          // FoodList(selected, (index) {
          //   setState(() {
          //     selected = index;
          //   });
          //   pageController.animateToPage(index,
          //       duration: const Duration(milliseconds: 300),
          //       curve: Curves.easeIn);
          // }, widget.restId),
          // Expanded(
          //     child: FoodListView(
          //   selected,
          //   (int index) {
          //     setState(() {
          //       selected = index;
          //     });
          //   },
          //   pageController,
          //   restaurants,
          // )),

          // Expanded(child: MenuScreen(restaurant: restaurant,))
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     onTap: (int index) {
      //       switch (index) {
      //         case 3:
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const AccountSettingPage()));
      //           break;
      //         case 2:
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const NotificationPage()));
      //           break;
      //         case 1:
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => MyHomePage()));
      //           break;
      //       }
      //     },
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home, color: Colors.black),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart, color: Colors.black),
      //         label: 'Shopping Cart',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications, color: Colors.black),
      //         label: 'Notifications',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.settings, color: Colors.black),
      //         label: 'Settings',
      //       ),
      //     ],
      //     // currentIndex: _selectedIndex,
      //     // onTap: (index) {
      //     //   setState(() {
      //     //     _selectedIndex = index;
      //     //   });
      //     // },
      //   ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => CartProvider() ));
      //   },
      //   backgroundColor: Color.fromRGBO(254, 194, 43, 1),
      //   child: Icon(Icons.shopping_cart),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: CartFloatingActionButton(onPressed: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(foodDetails: {  },) ));
      // },),
    );
  }
}
