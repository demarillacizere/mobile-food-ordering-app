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
    String? _firstName;
  String? _lastName;
  String? _email;
  String? fullName;

  Future<void> _getUserData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    setState(() {
      _firstName = userData.get('firstName');
      _lastName = userData.get('secondName');
      _email = userData.get('email');
      fullName = '${_firstName ?? "User Name"} ${_lastName ?? "Last Name"}';
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF7DD),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MyHomePage()),
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
            children:  [
              SizedBox(height: 60),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                fullName ?? "User Name",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                _email ?? 'user@example.com',
                style: const TextStyle(fontSize: 18),
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
                  child: Text(fullName ?? "User Name",),
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
                  child: Text(_email ?? 'user@example.com'),
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
                    MaterialPageRoute(builder: (context) => MyHomePage()));
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
