// import 'package:food_app/models/food.dart';
// import 'package:food_app/models/restaurants.dart';
// import 'package:food_app/screens/home/widget/food_item.dart';

// class CartPage extends StatefulWidget {
//   final List<Food> cartItems;

//   final Function(Food) addToCart;
//   CartPage(
//       {required this.cartItems,

//       required this.addToCart});

//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: widget.cartItems.isEmpty
//           ? Center(
//               child: Text('Your cart is empty'),
//             )
//           : ListView.builder(
//               itemCount: widget.cartItems.length,
//               itemBuilder: (context, index) {
//                 final item = widget.cartItems[index];
//                 return FoodItem(food: item);
//               },
//             ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class CartPage extends StatefulWidget {
//   final Map<String, int> foodDetails;

//   const CartPage({Key? key, required this.foodDetails}) : super(key: key);

//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   Map<String, int> _cartItems = {};

//   @override
//   void initState() {
//     super.initState();
//     _cartItems = Map<String, int>.from(widget.foodDetails);
//   }

//   void _removeFromCart(String itemName) {
//     setState(() {
//       _cartItems.remove(itemName);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: _cartItems.isNotEmpty
//           ? ListView.builder(
//               itemCount: _cartItems.length,
//               itemBuilder: (BuildContext context, int index) {
//                 String itemName = _cartItems.keys.toList()[index];
//                 int quantity = _cartItems.values.toList()[index];
//                 int price = _cartItems.values.toList()[index];
//                 return ListTile(
//                   title: Text(itemName),
//                   subtitle: Text('Quantity: $quantity'),
//                   trailing: Text(
//                     '${quantity * widget.foodDetails[itemName]!} Rwf',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   onTap: () => _removeFromCart(itemName),
//                 );
//               },
//             )
//           : Center(
//               child: Text('Cart is empty'),
//             ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/settings.dart';
import 'package:food_app/widgets/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notification_page.dart';

class CartPage extends StatefulWidget {
  final Map<String, Map<String, dynamic>> foodDetails;

  const CartPage({Key? key, required this.foodDetails}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Map<String, Map<String, dynamic>> _cartData;
  num _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _loadCartData();
  }

  Future<void> _loadCartData() async {
    final prefs = await SharedPreferences.getInstance();
    final cartDataString = prefs.getString('cartData') ?? '{}';
    setState(() {
      _cartData = Map<String, Map<String, dynamic>>.from(
        json.decode(cartDataString),
      );
    });
  }

  void _saveCartData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cartData', json.encode(_cartData));
  }

  void _addToCart(String itemName) {
    setState(() {
      if (_cartData.containsKey(itemName)) {
        _cartData[itemName]!['count'] += 1;
      } else {
        _cartData[itemName] = {
          'count': 1,
          'price': widget.foodDetails[itemName]!['price'],
        };
      }
      _totalPrice += widget.foodDetails[itemName]!['price'];
      _saveCartData();
    });
  }

  void _removeFromCart(String itemName) {
    setState(() {
      if (_cartData.containsKey(itemName)) {
        _cartData[itemName]!['count'] -= 1;
        if (_cartData[itemName]!['count'] == 0) {
          _cartData.remove(itemName);
        }
        _totalPrice -= widget.foodDetails[itemName]!['price'];
        _saveCartData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7DD),
      
      body: Column(
        children: [
          SizedBox(height: 10),
          CustomAppBar(
            Icons.arrow_back_ios_new_outlined,
            Icons.notifications,
            () => Navigator.pop(context),
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              );
            },
          ),
          Expanded(
            
            child: ListView.builder(
              itemCount: widget.foodDetails.length,
              itemBuilder: (context, index) {
                final itemName = widget.foodDetails.keys.elementAt(index);
                final itemDetails = widget.foodDetails[itemName]!;
                final itemCount = itemDetails['count'] ?? 0;
                final itemPrice = itemDetails['price'];
                // return ListTile(
                //   title: Text(itemName),
                //   subtitle: Text('Count: $itemCount, Price: $itemPrice Rwf'),
                //   trailing: IconButton(
                //     icon: Icon(Icons.add),
                //     onPressed: () => _addToCart(itemName),
                //   ),
                //   onTap: itemCount > 0 ? () => _removeFromCart(itemName) : null,
                // );
                return Card(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  color: Colors.white,
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('assets/images/orderImage.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(itemName,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "$itemPrice Rwf",
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Quantity: $itemCount')
                              ],
                            ),
                            Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                      'Total: ${int.parse(itemPrice) * itemCount} Rwf'),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          _removeFromCart(itemName);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // if (_cartData.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Card(
                
                margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                color: Colors.white,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Total: $_totalPrice Rwf'),
                      SizedBox(height: 10),
                      ElevatedButton(
                       
                        onPressed: () {},
                        child: Text('Place Order'),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(254, 194, 43, 1))) ,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                  MaterialPageRoute(builder: (context) =>  CartPage(foodDetails: {},)));
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
        // currentIndex: _selectedIndex,
        // onTap: (index) {
        //   setState(() {
        //     _selectedIndex = index;
        //   });
        // },
      ),
    );
    
  }
}
