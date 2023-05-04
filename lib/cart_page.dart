import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/settings.dart';
import 'package:food_app/widgets/custom_app_bar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  late Stream<QuerySnapshot<Map<String, dynamic>>> _cartStream;
  @override
  void initState() {
    super.initState();
 

    // Initialize the FlutterLocalNotificationsPlugin instance
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String _currentUserId = user!.uid;
    final CollectionReference usersRef = FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUserId)
        .collection('cart');
      _cartStream = FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUserId)
          .collection('cart')
          .snapshots();
   
  }

// fetch the documents in the collection

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
      const SnackBar(
        content: Text('Order has been placed!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Chap Chap Food',
      'Your order has been sent!',
      platformChannelSpecifics,
    );

    // Get the current user ID
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String userId = user!.uid;

    // Save the notification to Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .add({
      'title': 'Order has been sent',
      'body': 'Your order has been sent!',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> showSecondNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Notification',
      'Your order has been accepted by the restaurant!',
      platformChannelSpecifics,
    );

    // Get the current user ID
    // Get the current user ID
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String userId = user!.uid;

    // Save the notification to Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('notifications')
        .add({
      'title': 'Order Received',
      'body': 'Your order has been received by the vendor!',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF7DD),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _cartStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final orders = snapshot.data!.docs;

              if (orders.isEmpty) {
                return const Center(
                  child: Text('You have no items in the  cart.'),
                );
              }

              return Column(
                children: [
                  const SizedBox(height: 10),
                  CustomAppBar(
                    Icons.arrow_back_ios_new_outlined,
                    Icons.notifications,
                    () => Navigator.pop(context),
                    itemBuilder: (context, index) {
                      return const Card(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                      );
                    },
                  ),
                  const Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (BuildContext context, int index) {
                        final order = orders[index];

                        return Card(
                          margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
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
                                      order['imageUrl'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 8.0, 0.0, 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(order['name'],
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "Quantity: ${order['quantity']}",
                                      style: const TextStyle(fontSize: 14.0),
                                    ),
                                    Text(
                                      "Total: ${order['price'] * order['quantity']} Rwf",
                                      style: const TextStyle(fontSize: 14.0),
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
                          Future.delayed(const Duration(seconds: 2),
                              () => showNotification());
                          Future.delayed(const Duration(seconds: 10),
                              () => showSecondNotification());
                        },
                        child: const Text('Place Order'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(254, 194, 43, 1))),
                      ),
                      const SizedBox(width: 15)
                    ],
                  ),
                ],
              );
            }
        ),
              bottomNavigationBar:
              BottomNavigationBar(
                onTap: (int index) {
                  switch (index) {
                    case 3:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AccountSettingPage()));
                      break;
                    case 2:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationPage()));
                      break;
                    case 0:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
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
              ));
            
  }
}
