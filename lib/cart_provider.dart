import 'package:flutter/material.dart';
// import 'package:my_app/models/food.dart';

import 'models/food.dart';

class CartProvider with ChangeNotifier {
  Map<String, Map<String, dynamic>> _foodDetails = {};

  Map<String, Map<String, dynamic>> get foodDetails => _foodDetails;

  void addToCart(Food food, int count) {
    if (count > 0) {
      _foodDetails[food.name] = {
        'count': count,
        'price': food.price,
      };
      notifyListeners();
    }
  }

  void removeFromCart(String foodName) {
    _foodDetails.remove(foodName);
    notifyListeners();
  }

  void clearCart() {
    _foodDetails.clear();
    notifyListeners();
  }
}
