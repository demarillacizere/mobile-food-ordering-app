import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../models/restaurants.dart';

class FoodList extends StatelessWidget {
  final int selected;
  final Function callback;
  final Restaurant restaurant;
  FoodList(this.selected, this.callback, this.restaurant);

  @override
  Widget build(BuildContext context) {
    final category = restaurant.menu.keys.toList();
    return Container(
        height: 100,
        margin: EdgeInsets.only(left: 16),
        padding: EdgeInsets.symmetric(vertical: 30),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => callback(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: selected == index
                      ? const Color.fromRGBO(254, 194, 43, 1)
                      : Colors.transparent),
              child: 
                  Text(
                    category[index],
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: selected == index
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFFB7B7B7)),
                  ),
                 
            ),
          ),
          itemCount: category.length,
          separatorBuilder: (_, index) => const SizedBox(
            width: 20,
          ),
        ));
  }
}
