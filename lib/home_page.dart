import 'package:flutter/material.dart';
import 'package:food_app/search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Container> _items = [
    Container(
        color: Colors.yellow,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Text('Food'),
        )),
    Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Text('Drinks'),
        )),
    Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Text('Snacks'),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              backgroundImage: const AssetImage('../assets/images/profile.png'),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('../assets/images/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFFFF7DD),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                    child: Text('Choose the Food you want to Order',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(254, 194, 43, 1)))),
              ),
              CarouselSlider(
                items: _items,
                options: CarouselOptions(
                  height: 40.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.3,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  // autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  // onPageChanged: (index, reason) {
                  //   setState(() {
                  //     _current = index;
                  //   });
                  // },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Card(
                color: Colors.white,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('../assets/images/orderImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 8.0, 0.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Divine',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('../assets/images/orderImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 8.0, 0.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Dyners',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('../assets/images/orderImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 8.0, 0.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Meze Fresh',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('../assets/images/orderImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 8.0, 0.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Scholars Cafe',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('../assets/images/orderImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 8.0, 0.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Mojito',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}