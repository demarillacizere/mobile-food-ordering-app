import 'package:flutter/material.dart';
import 'package:food_app/search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

// import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const OrderPage());
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chap Chap Delivery',
      theme: ThemeData(
          // primarySwatch: Color(0xFFfff7dd),
          ),
      home: const MyOrderPage(),
    );
  }
}

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  int _selectedIndex = 0;
  int _count = 1;
  int _count2 = 0;
  int _count3 = 0;
  int _count4 = 0;
  int _count5 = 0;

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
              backgroundImage: const AssetImage('assets/images/profile.png'),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
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
              Card(
                color: Colors.white,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/images/orderImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 8.0, 0.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Burger',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text('Rwf 1500')
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              icon: const Icon(Icons.remove, size: 15.0),
                              onPressed: () {
                                setState(() {
                                  if (_count <= 0) {
                                    _count = 0;
                                  } else {
                                    _count--;
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Text('$_count',
                              style: const TextStyle(fontSize: 18.0)),
                          const SizedBox(width: 10.0),
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              icon: const Icon(Icons.add, size: 15.0),
                              onPressed: () {
                                setState(() {                         
                                    _count++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
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
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/images/orderImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 8.0, 0.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Rolex',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text('Rwf 1500'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              icon: const Icon(Icons.remove, size: 15.0),
                              onPressed: () {
                                setState(() {
                                  if (_count2 <= 0) {
                                    _count2 = 0;
                                  } else {
                                    _count2--;
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Text('$_count2',
                              style: const TextStyle(fontSize: 18.0)),
                          const SizedBox(width: 10.0),
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              icon: const Icon(Icons.add, size: 15.0),
                              onPressed: () {
                                setState(() {
                                  _count2++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        // Delete functionality goes here
                      },
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
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/images/orderImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 8.0, 0.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Pizza',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text('Rwf 1500'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              icon: const Icon(Icons.remove, size: 15.0),
                              onPressed: () {
                                setState(() {
                                  if (_count3 <= 0) {
                                    _count3 = 0;
                                  } else {
                                    _count3--;
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Text('$_count3',
                              style: const TextStyle(fontSize: 18.0)),
                          const SizedBox(width: 10.0),
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              icon: const Icon(Icons.add, size: 15.0),
                              onPressed: () {
                                setState(() {
                                  _count3++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        // Delete functionality goes here
                      },
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
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/images/orderImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 8.0, 0.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Salad',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text('Rwf 1500'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              icon: const Icon(Icons.remove, size: 15.0),
                              onPressed: () {
                                setState(() {
                                  if (_count4 <= 0) {
                                    _count4 = 0;
                                  } else {
                                    _count4--;
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Text('$_count4',
                              style: const TextStyle(fontSize: 18.0)),
                          const SizedBox(width: 10.0),
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              icon: const Icon(Icons.add, size: 15.0),
                              onPressed: () {
                                setState(() {
                                  _count4++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        // Delete functionality goes here
                      },
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
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/images/orderImage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 8.0, 0.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Chicken Wrap',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text('Rwf 1500'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              icon: const Icon(Icons.remove, size: 15.0),
                              onPressed: () {
                                setState(() {
                                  if (_count5 <= 0) {
                                    _count5 = 0;
                                  } else {
                                    _count5--;
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Text('$_count5',
                              style: const TextStyle(fontSize: 18.0)),
                          const SizedBox(width: 10.0),
                          CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              icon: const Icon(Icons.add, size: 15.0),
                              onPressed: () {
                                setState(() {
                                  _count5++;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        // Delete functionality goes here
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(310, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(254, 194, 43, 1)),
                  ),
                  child: const Text(
                    'CheckOut',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
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
