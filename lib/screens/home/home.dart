import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_app/screens/home/widget/food_list.dart';
import 'package:food_app/screens/home/widget/food_list_view.dart';
import 'package:food_app/screens/home/widget/restaurant_info.dart';
import 'package:food_app/screens/home/widget/restaurant_list_view.dart';

import '../../models/restaurants.dart';
import '../../widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7DD),
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(Icons.arrow_back_ios_new_outlined, Icons.notifications,
            () => Navigator.pop(context)),
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
        RestaurantInfo(),
        FoodList(selected, (index) {
          setState(() {
            selected = index;
          });
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }, restaurant[selected]),
        Expanded(child: FoodListView(
          selected, 
          (int index) {
            setState(() {
              selected = index;
            });
          },
          pageController,
          restaurant[selected],
          
        )
        ),
      ],
    ));
  }
}
