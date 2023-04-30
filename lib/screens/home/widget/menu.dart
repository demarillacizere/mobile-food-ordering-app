import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/restaurants.dart';
import 'package:food_app/screens/home/widget/restaurant_info.dart';

import '../../../widgets/custom_app_bar.dart';
import 'food_list.dart';
import 'food_list_view.dart';

class MenuScreen extends StatefulWidget {
  final Restaurant restaurant;

  const MenuScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    var selected = 0;
    final pageController = PageController();
    
    return Scaffold(  
       
      backgroundColor: const Color(0xFFFFF7DD),   
      body: Column(
        children: [
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
          RestaurantInfo(restaurant: widget.restaurant),
          FoodList(selected, (index) {
          setState(() {
            selected = index;
          });
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }, widget.restaurant),
        // Expanded(child: FoodListView(
        //   selected, 
        //   (int index) {
        //     setState(() {
        //       selected = index;
        //     });
        //   },
        //   pageController,
        //   widget.restaurant
          
        //   )
        // ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.restaurant.menu.length,
              itemBuilder: (BuildContext context, int index) {
                final category = widget.restaurant.menu.keys.elementAt(index);
                final items = widget.restaurant.menu[category]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = items[index];
                        return Container(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item.name,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        item.price.toString() + " Rwf",
                                        style: TextStyle(fontSize: 14.0),
                                      )
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
                                          icon: const Icon(Icons.add, size: 15.0),
                                          onPressed: () {
                                            // Add functionality goes here
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Text("2",
                                          style: TextStyle(fontSize: 18.0)),
                                      const SizedBox(width: 10.0),
                                      CircleAvatar(
                                        radius: 15.0,
                                        backgroundColor: Colors.grey[300],
                                        child: IconButton(
                                          icon: const Icon(Icons.remove, size: 15.0),
                                          onPressed: () {
                                            // Add functionality goes here
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
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
