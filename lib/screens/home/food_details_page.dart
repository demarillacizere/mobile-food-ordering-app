import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../models/food.dart';
import '../../cart_page.dart';
import '../../notification_page.dart';
import '../../order_page.dart';
import '../../settings.dart';
import '../../widgets/custom_app_bar.dart';

class FoodDetailsPage extends StatefulWidget {
  final String food;
  final String price;
  final String description;
  final Widget floatingActionButton;

  const FoodDetailsPage({
    Key? key,
    required this.food,
    required this.floatingActionButton,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int _count = 0;
  Map<String, Map<String, dynamic>> foodDetails = {};

  void addToCart() {
  if (_count > 0) {
    final String itemName = widget.food;
    final double itemPrice = double.parse(widget.price);
    final int itemQuantity = _count;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("cart").add({
      "name": itemName,
      "price": itemPrice,
      "quantity": itemQuantity
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item added to cart'),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add item to cart: $error'),
        ),
      );
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select quantity'),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7DD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
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
          Center(
            child: Container(
              width: 200, // set the desired width
              height: 200, // set the desired height
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(
                  image: AssetImage('assets/images/orderImage.png'),
                  fit:
                      BoxFit.contain, // make the image fill the available space
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.food,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.price} Rwf',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     IconButton(
                  //       icon: const Icon(Icons.remove),
                  //       onPressed: () {
                  //         setState(() {
                  //           if (_count <= 0) {
                  //             _count = 0;
                  //           } else {
                  //             _count--;
                  //           }
                  //         });
                  //       },
                  //     ),
                  //     const SizedBox(width: 16),
                  //     Text(
                  //       _count.toString(),
                  //       style: Theme.of(context).textTheme.subtitle1,
                  //     ),
                  //     const SizedBox(width: 16),
                  //     IconButton(
                  //       icon: const Icon(Icons.add),
                  //       onPressed: () {
                  //         setState(() {
                  //           _count++;
                  //         });
                  //       },
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.grey[300],
                          child: IconButton(
                            icon: const Icon(Icons.remove,
                                size: 15.0, color: Colors.black),
                            onPressed: () {
                              setState(() {
                                if (_count <= 0) {
                                  _count = 0;
                                } else {
                                  _count--;
                                }
                                // widget.onCountChanged(widget.food.name, _count);
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(_count.toString(),
                            style: TextStyle(fontSize: 18.0)),
                        const SizedBox(width: 10.0),
                        CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.grey[300],
                          child: IconButton(
                            icon: const Icon(Icons.add,
                                size: 15.0, color: Colors.black),
                            onPressed: () {
                              setState(() {
                                _count++;
                                // widget.onCountChanged(widget.food.name, _count);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(
                            
                          )));
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
      floatingActionButton:
          CartFloatingActionButton(onPressed: () => addToCart()),
    );
  }
}

class CartFloatingActionButton extends StatelessWidget {
  const CartFloatingActionButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: FloatingActionButton.extended(
        label: const Text('Place Order'),
        icon: const Icon(Icons.start_outlined),
        onPressed: onPressed,
        backgroundColor: Color.fromRGBO(254, 194, 43, 1),
      ),
    );
  }
}
