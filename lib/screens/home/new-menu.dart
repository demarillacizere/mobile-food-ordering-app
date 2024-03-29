import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_app/screens/home/widget/restaurant_info.dart';

import '../../cart_page.dart';
import '../../cart_provider.dart';
import '../../home_page.dart';
import '../../notification_page.dart';
import '../../settings.dart';
import '../../widgets/custom_app_bar.dart';
import 'food_details_page.dart';

class RestaurantDetail extends StatefulWidget {
  final String restId;
  const RestaurantDetail({super.key, required this.restId});

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  String? restName;
  String? restLabel;
  String? restMenu;
  String? restScore;

  getData() async {
    DocumentSnapshot restData = await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(widget.restId)
        .get() as DocumentSnapshot;

    setState(() {
      restName = restData.get('name');
      restLabel = restData.get('label');
      restScore = restData.get('score');
    });
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  List<String> imageUrls = [
    'https://images.unsplash.com/photo-1562059390-a761a084768e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=819&q=80',
    'https://images.unsplash.com/photo-1551024709-8f23befc6f87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=957&q=80',
    'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YnVycml0b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1563227812-0ea4c22e6cc8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    // add more image URLs here
  ];

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
              return const Card(
                margin: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          RestaurantInfo(
            restaurant: widget.restId,
            score: '3',
          ),
          Container(
              height: 200,
              margin: EdgeInsets.only(left: 16),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  child: Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                itemCount: imageUrls.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
              )),
          FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('restaurant')
                .doc(widget.restId)
                .get(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!['menu2'].length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FoodDetailsPage(
                                  restaurant: snapshot.data!['name'],
                                  food: snapshot.data!['menu2'][index]['name'],
                                  floatingActionButton:
                                      CartFloatingActionButton(
                                          onPressed: () => CartPage()),
                                  description: snapshot.data!['menu2'][index]
                                      ['description'],
                                  price: snapshot.data!['menu2'][index]
                                      ['price'],
                                  imageUrl: snapshot.data!['menu2'][index]
                                      ['imageUrl'],
                                )));
                      },
                      // child: ListTile(
                      //   leading: Container(
                      //     height: 60,
                      //     width: 60,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     child: ClipRRect(
                      //       borderRadius: BorderRadius.circular(10),
                      //       child: Image.network(
                      //         snapshot.data!['menu2'][index]['imageUrl'],
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   ),
                      //   title: Text(snapshot.data!['menu2'][index]['name']),
                      //   subtitle:
                      //       Text(snapshot.data!['menu2'][index]['description']),
                      //   // trailing: Container(
                      //   //   height: 60,
                      //   //   width: 60,
                      //   //   child: Row(
                      //   //     mainAxisAlignment: MainAxisAlignment.end,
                      //   //     children: [
                      //   //       IconButton(
                      //   //           onPressed: () {},
                      //   //           icon: Icon(
                      //   //             Icons.add_circle_rounded,
                      //   //             color: Colors.yellow,
                      //   //           )),
                      //   //       IconButton(
                      //   //           onPressed: () {},
                      //   //           icon: Icon(Icons.remove_circle_rounded,
                      //   //               color: Colors.yellow)),
                      //   //     ],
                      //   //   ),
                      //   // ),
                      // ),
                      child: Card(
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
                                    snapshot.data!['menu2'][index]['imageUrl'],
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
                                  Text(snapshot.data!['menu2'][index]['name'],
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    snapshot.data!['menu2'][index]['price'],
                                    style: TextStyle(fontSize: 14.0),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                    child: Column(
                  children: const [
                    Icon(Icons.hourglass_empty_rounded),
                    Text('No food available'),
                  ],
                ));
              }
            }),
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
