import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/settings.dart';
import 'package:food_app/widgets/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'notification_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> restaurants = [];

  var selected = 0;
  final pageController = PageController();

  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('cart');

// fetch the documents in the collection
  Future<void> get() async {
    try {
      QuerySnapshot snapshot = await usersRef.get();
      setState(() {
        restaurants = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  void placeOrder() async {
    // final FirebaseFirestore firestore = FirebaseFirestore.instance;
    // await firestore.collection("cart").get().then((querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     doc.reference.delete();
    //   });
    // });
    // setState(() {
    //   restaurants.clear();
    // });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order has been placed!'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    get();
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
          Text(
            'Cart',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                final restaurant = restaurants[index];

                return Card(
                  margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  color: Colors.white,
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    restaurant['imageUrl'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(restaurant['name'],
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                            
                            Text(
                              "Quantity: " + restaurant['quantity'].toString(),
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Text(
                              "Total: " +
                                  (restaurant['price'] * restaurant['quantity'])
                                      .toString() + " Rwf",
                              style: TextStyle(fontSize: 14.0),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
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
              ElevatedButton(
                onPressed: () {
                  placeOrder();
                },
                child: Text('Place Order'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(254, 194, 43, 1))),
              ),
              SizedBox(width: 15)
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
            case 0:
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
    );
  }
}
