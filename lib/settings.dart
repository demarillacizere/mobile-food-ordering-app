import 'package:flutter/material.dart';
import 'package:food_app/order_page.dart';
import 'cart_page.dart';
import 'home_page.dart';
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
      home: const AccountSettingPage(),
    );
  }
}

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) => MyHomePage(),
  // '/settings': (BuildContext context) => AccountSettingPage(),
};

class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({super.key});

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF7DD),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => const MyHomePage()),
        //       );
        //     },
        //     backgroundColor: Colors.yellow,
        //     child: const Icon(Icons.home)),
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
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.person),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Profile Information'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('Change your account information'),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.password),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Change Password'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('Change Password'),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.language_rounded),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Language'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('English'),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.payment_outlined),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Payment Methods'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('Add your credit & debit cards'),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.location_on),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Locations'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('Add or remove your delivery locations'),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.facebook_rounded),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Add Social Account'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('Add Facebook, Twitter etc'),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.woman_rounded),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Refer to Friends'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('Get Rwf 1000 for refering friends'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text(
              //       "This text is at the beginning of the row",
              //       style: TextStyle(fontSize: 18),
              //     ),
              //     // Other widgets can be added here
              //   ],
              // ),
              Text(
                'MORE',
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Rate Us'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text('Rate us playstore, appstor'),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    Icons.logout,
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Logout'),
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
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartPage(foodDetails: {},)));
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
          currentIndex: _selectedIndex,
        ));
  }
}
