import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../models/food.dart';
import '../../../models/restaurants.dart';
import 'food_item.dart';

class FoodListView extends StatefulWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Restaurant restaurant;

  FoodListView(
      this.selected, this.callback, this.pageController, this.restaurant);

  @override
  _FoodListViewState createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  final List<int> _counts = [];

  @override
  void initState() {
    super.initState();
    widget.restaurant.menu.values.forEach((foods) {
      _counts.addAll(List.filled(foods.length, 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = widget.restaurant.menu.keys.toList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: PageView(
        controller: widget.pageController,
        onPageChanged: (index) => widget.callback(index),
        children: category.map((e) {
          final foods = widget.restaurant.menu[e];
          return ListView.separated(
            itemBuilder: (context, index) => FoodItem(  food: foods![index], onCountChanged: (String , int ) {  }),
            itemCount: foods!.length,
            separatorBuilder: (_, index) => const SizedBox(
              height: 0,
            ),
          );
        }).toList(),
      ),
    );
  }
}
