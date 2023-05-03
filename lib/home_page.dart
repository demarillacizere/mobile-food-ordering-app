// import 'package:flutter/material.dart';
// import 'package:food_app/order_page.dart';
// import 'package:food_app/screens/home/widget/restaurant_list_view.dart';
// import 'package:food_app/search_bar.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'models/restaurants.dart';
// import 'settings.dart';
// import 'notification_page.dart';
// import 'profile_page.dart';

// // import 'package:firebase_core/firebase_core.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var selected = 0;
//   final pageController = PageController();
//   final restaurant = Restaurant.generateRestaurant();
//   final Map<String, WidgetBuilder> routes = {
//   '/notification': (BuildContext context) => NotificationPage(),
//   '/settings': (BuildContext context) => AccountSettingPage(),
// };
// final List<Container> _items = [
//     Container(
//       height: 40.0,
//       width: 80.0,
//       color: Colors.yellow,
//       // child: const Padding(
//       // padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//       child: const Center(child: Text('Food')),
//     ),
//     Container(
//       height: 40.0,
//       width: 80.0,
//       color: Colors.yellow,
//       // child: const Padding(
//       // padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//       child: const Center(child: Text('Drinks')),
//     ),
//     Container(
//       height: 40.0,
//       width: 80.0,
//       color: Colors.yellow,
//       // child: const Padding(
//       // padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//       child: const Center(child: Text('Snacks')),
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: const Color(0xFFFFF7DD),
//         body:  Container(
//         color: const Color(0xFFFFF7DD),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ListView(
//             scrollDirection: Axis.vertical,
//             children: <Widget>[
//               const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text('Choose the\nFood You Love',
//                     style: TextStyle(
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromRGBO(254, 194, 43, 1))),
//               ),
//               CarouselSlider(
//                 items: _items,
//                 options: CarouselOptions(
//                   height: 40.0,
//                   aspectRatio: 16 / 9,
//                   viewportFraction: 0.3,
//                   initialPage: 0,
//                   enableInfiniteScroll: true,
//                   reverse: false,
//                   // autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 3),
//                   autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enlargeCenterPage: true,
//                   // onPageChanged: (index, reason) {
//                   //   setState(() {
//                   //     _current = index;
//                   //   });
//                   // },
//                   scrollDirection: Axis.horizontal,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Expanded(
//                 child: RestaurantsListView(
//                   selected,
//                   (int index) {
//                     setState(() {
//                       selected = index;
//                     });
//                   },
//                   pageController,
//                   restaurant[selected],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (int index) {
//           switch (index) {
//             case 3:
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const AccountSettingPage()));
//               break;
//             case 2:
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const NotificationPage()));
//               break;
//             case 1:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const MyOrderPage()));
//               break;
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home, color: Colors.black),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart, color: Colors.black),
//             label: 'Shopping Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications, color: Colors.black),
//             label: 'Notifications',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings, color: Colors.black),
//             label: 'Settings',
//           ),
//         ],
//         // currentIndex: _selectedIndex,
//         // onTap: (index) {
//         //   setState(() {
//         //     _selectedIndex = index;
//         //   });
//         // },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:food_app/screens/home/home.dart';
// import 'package:food_app/screens/home/widget/food_list.dart';
// import 'package:food_app/screens/home/widget/food_list_view.dart';
// import 'package:food_app/screens/home/widget/menu.dart';
// import 'package:food_app/screens/home/widget/restaurant_info.dart';
// import 'package:food_app/screens/home/widget/restaurant_list_view.dart';

// import '../../models/restaurants.dart';
// import '../../widgets/custom_app_bar.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var selected = 0;
//   final pageController = PageController();
//   final restaurants = Restaurant.generateRestaurant();
//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       backgroundColor: const Color(0xFFFFF7DD),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomAppBar(Icons.arrow_back_ios_new_outlined, Icons.notifications,
//               () => Navigator.pop(context)),
//           const SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
//             child: Text('Choose the\nFood You Love',
//                 style: TextStyle(
//                     fontSize: 30.0,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromRGBO(254, 194, 43, 1))),
//           ),
// const Padding(
//   padding: EdgeInsets.only(left: 16.0),
//   child: Text(
//     'What would you like to eat?',
//     style: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w500,
//     ),
//   ),
// ),
// const SizedBox(
//   height: 20,
// ),
// Padding(
//   padding: const EdgeInsets.only(left: 26.0),
//   child: SizedBox(
//     height: 50,
//     width: MediaQuery.of(context).size.width - 52,
//     child: TextField(
//       decoration: InputDecoration(
//         hintText: 'Search',
//         prefixIcon: const Icon(Icons.search),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     ),
//   ),
// ),
// const SizedBox(
//   height: 20,
// ),
// RestaurantInfo(),
// FoodList(selected, (index) {
//   setState(() {
//     selected = index;
//   });
//   pageController.animateToPage(index,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeIn);
// }, restaurant[selected]),

//             ListView.builder(
//       itemCount: restaurants.length,
//       itemBuilder: (BuildContext context, int index) {
//         final restaurant = restaurants[index];
//         return Card(
//           child: ListTile(
//             title: Text(restaurant.name),
//             subtitle: Text(restaurant.label),
//             trailing: Icon(Icons.keyboard_arrow_right),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MenuScreen(restaurant: restaurant),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     )
//           ],
//         ));
//   }
// }

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/home/new-menu.dart';
// import 'package:food_app/models/restaurants.dart';

import 'package:food_app/screens/home/home.dart';

import 'package:food_app/settings.dart';
import 'package:food_app/widgets/custom_app_bar.dart';

import 'notification_page.dart';
import 'order_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> restaurants = [];

  var selected = 0;
  final pageController = PageController();
// final restaurant = Restaurant.fromJson(json as Map<String, dynamic>);

// create a reference to the Firestore collection
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('restaurant');

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

  @override
  void initState() {
    super.initState();
    get();
  }

  final Map<String, WidgetBuilder> routes = {
    '/notification': (BuildContext context) => NotificationPage(),
    '/settings': (BuildContext context) => AccountSettingPage(),
  };
  // final restaurants = Restaurant.;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7DD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          CustomAppBar(
            Icons.arrow_back_ios_new_outlined,
            Icons.notifications,
            () => Navigator.pop(context),
            itemBuilder: (context, index) {
              return const Card(
                margin: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 16, 8, 0),
            child: Text('Choose the\nFood You Love',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(254, 194, 43, 1))),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                final restaurant = restaurants[index];

                return Card(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: ListTile(
                    leading: Image(
                      image: AssetImage('assets/images/orderImage.png'),
                      fit: BoxFit.cover,
                    ),
                    title: Text(restaurant['name']),
                    subtitle: Text(restaurant['label']),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantDetail(
                                    restId: restaurant['name'],
                                  )));
                    },
                  ),
                );
              },
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyOrderPage()));
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
