import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/restaurants.dart';
import 'package:food_app/screens/home/widget/food_item.dart';

class CartPage extends StatefulWidget {
  final List<Food> cartItems;
  
  final Function(Food) addToCart;
  CartPage(
      {required this.cartItems,
   
      required this.addToCart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: widget.cartItems.isEmpty
          ? Center(
              child: Text('Your cart is empty'),
            )
          : ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return FoodItem(food: item, onCountChanged: (String , int ) {  });
              },
            ),
    );
  }
}
