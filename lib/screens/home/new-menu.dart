import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_app/screens/home/widget/restaurant_info.dart';

import '../../cart_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Details'),
      ),
      body: Column(
        children: [
          RestaurantInfo(restaurant: widget.restId, score: '3', ),

          FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('restaurant')
                .doc(widget.restId)
                .get(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!['menu2'].length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FoodDetailsPage(
                food: snapshot.data!['menu2'][index]['name'],
                floatingActionButton: CartFloatingActionButton(
                    onPressed: () => CartPage(
                          foodDetails: {},
                        )), description: snapshot.data!['menu2'][index]['description'], price: snapshot.data!['menu2'][index]['price'],)));
                      },
                      child: ListTile(
                        leading: Container(
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
                        title: Text(snapshot.data!['menu2'][index]['name']),
                        subtitle: Text(
                            snapshot.data!['menu2'][index]['description']),
                        // trailing: Container(
                        //   height: 60,
                        //   width: 60,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       IconButton(
                        //           onPressed: () {},
                        //           icon: Icon(
                        //             Icons.add_circle_rounded,
                        //             color: Colors.yellow,
                        //           )),
                        //       IconButton(
                        //           onPressed: () {},
                        //           icon: Icon(Icons.remove_circle_rounded,
                        //               color: Colors.yellow)),
                        //     ],
                        //   ),
                        // ),
                      ),
                    );
                    GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => FoodDetailsPage(
        //         food: widget.food,
        //         floatingActionButton: CartFloatingActionButton(
        //             onPressed: () => CartPage(
        //                   foodDetails: {},
        //                 )))));
      },
      child: Card(
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
          padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(snapshot.data!['menu2'][index]['name'],
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold)),
              Text(
                snapshot.data!['menu2'][index]['price'] + " Rwf",
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
            ),
            const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       CircleAvatar(
            //         radius: 15.0,
            //         backgroundColor: Colors.grey[300],
            //         child: IconButton(
            //           icon: const Icon(Icons.remove, size: 15.0),
            //           onPressed: () {
            //             setState(() {
            //               if (_count <= 0) {
            //                 _count = 0;
            //               } else {
            //                 _count--;
            //               }
            //               // widget.onCountChanged(widget.food.name, _count);
            //             });
            //           },
            //         ),
            //       ),
            //       const SizedBox(width: 10.0),
            //       Text(_count.toString(), style: TextStyle(fontSize: 18.0)),
            //       const SizedBox(width: 10.0),
            //       CircleAvatar(
            //         radius: 15.0,
            //         backgroundColor: Colors.grey[300],
            //         child: IconButton(
            //           icon: const Icon(Icons.add, size: 15.0),
            //           onPressed: () {
            //             setState(() {
            //               _count++;
            //               // widget.onCountChanged(widget.food.name, _count);
            //             });
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // IconButton(
            //   icon: const Icon(Icons.delete),
            //   color: Colors.red,
            //   onPressed: () {
            //     // Delete functionality goes here
            //   },
            // ),
          ],
        ),
      ),
    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: Colors.black12,
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
