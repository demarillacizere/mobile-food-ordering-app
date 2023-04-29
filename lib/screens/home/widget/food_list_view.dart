import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../models/food.dart';
import '../../../models/restaurants.dart';
import 'food_item.dart';

class FoodListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Restaurant restaurant;
  
  FoodListView(
      this.selected, this.callback, this.pageController, this.restaurant);
  @override
  Widget build(BuildContext context) {
    final category = restaurant.menu.keys.toList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: 
          category.map((e) => ListView.separated(
            itemBuilder: (context, index) => FoodItem(restaurant.menu[category[selected]]![index]),
            itemCount: restaurant.menu[category[selected]]!.length,
            separatorBuilder: (_, index) => const SizedBox(
              height: 20,),
          )).toList(),
      )
    );
  }
}


