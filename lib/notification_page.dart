import 'package:flutter/material.dart';
import 'package:food_app/order_page.dart';
import 'package:food_app/search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'cart_page.dart';
import 'home_page.dart';
import 'settings.dart';
import 'profile_page.dart';

// import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chap Chap Delivery',
      theme: ThemeData(
          // primarySwatch: Color(0xFFfff7dd),
          ),
      home: const NotificationPage(),
    );
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 0;
  String searchText = '';
  late Stream<QuerySnapshot<Map<String, dynamic>>> _notificationStream;
  @override
  void initState() {
    super.initState();

    // Initialize the FlutterLocalNotificationsPlugin instance
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String currentUserId = user!.uid;
    _notificationStream = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .collection('notifications')
        .orderBy('timestamp',descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF7DD),
        appBar: AppBar(
          backgroundColor: const Color(0xFFfff7dd),
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  showSearch(context: context, delegate: SearchBarDelegate());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 20.0, // adjust the radius according to your preference
                backgroundImage: const AssetImage('assets/images/profile.png'),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // do something when the image is tapped
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserProfilePage()));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _notificationStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final notifications = snapshot.data!.docs;

              if (notifications.isEmpty) {
                return const Center(
                  child: Text('You have no notifications.'),
                );
              }

              return Column(
                children: [
                  const SizedBox(height: 10),
                  
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (BuildContext context, int index) {
                        final notification = notifications[index];

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
                                    // child: Image.network(
                                    //   notification['imageUrl'],
                                    //   fit: BoxFit.cover,
                                    // ),
                                    child:Image.asset(
                                      'assets/images/home_icon.png',
                                      width: 330,
                                      height: 252,
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(notification['title'],
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width:270,
                                      child: 
                                        Text(
                                          " ${notification['body']}",
                                          style: const TextStyle(fontSize: 14.0),
                                        ),
                                      
                                    ),
                                    
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                          "${DateFormat.Hm().format(notification['timestamp'].toDate())}",
                                          style: const TextStyle(fontSize: 14.0),
                                        ),
                                    const SizedBox(
                                      height: 10,
                                    ),

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
                ],
              );
            }),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
                break;
              case 1:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
                break;
              case 3:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountSettingPage()));
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
