import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'settings.dart';
import 'notification_page.dart';

// void main() async {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chap Chap Delivery',
      theme: ThemeData(
          // primarySwatch: const Color(0xFFfff7dd),
          ),
      home: const UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  int _selectedIndex = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String firstname = '';
  String email = '';
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    final User? user = auth.currentUser;
    final DocumentSnapshot snapshot =
        await firestore.collection('users').doc(user?.uid).get();

    setState(() {
      firstname = snapshot['firstName'];
      email = snapshot['email'];
      print(firstname);
      // phoneNumber = snapshot['phone_number'];
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF7DD),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
            backgroundColor: Colors.yellow,
            child: const Icon(Icons.home)),
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Username',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'user@example.com',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 50,
              ),
              Text('Profile Settings'),
              SizedBox(
                height: 30,
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.person),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Full Name:'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('John Doe'),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.email),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Email'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('user@example.com'),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.phone),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Phone Number'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('+1 123-456-7890'),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.password_rounded),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Password'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('************'),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
                break;
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
