// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:food_app/screens/home/home.dart';
// import 'package:food_app/screens/home/widget/restaurant_item.dart';

// import '../../../models/food.dart';
// import '../../../models/restaurants.dart';
// import 'food_item.dart';

// class RestaurantsListView extends StatelessWidget {
//   final int selected;
//   final Function callback;
//   final PageController pageController;
//   final Restaurant restaurant;

//   RestaurantsListView(
//       this.selected, this.callback, this.pageController, this.restaurant);
//   @override
//   Widget build(BuildContext context) {
//     final restaurants = restaurant.name;
    
// List<String> words = restaurants.split(' '); // split string into list of words
// List<int> wordLengths = words.map((word) => word.length).toList(); // map each word to its length and return a new list

//     return GestureDetector(
//       onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => HomePage()));
//         },
//       child: Container(
        
//         padding: const EdgeInsets.symmetric(horizontal: 25),
//         child: PageView(
//           controller: pageController,
//           onPageChanged: (index) => callback(index),
//           children: 
//             wordLengths.map((e) => ListView.separated(
//               itemBuilder: (context, index) => RestaurantItem(restaurant),
//               itemCount: restaurant.name.length,
//               separatorBuilder: (_, index) => const SizedBox(
//                 height: 20,),
//             )).toList(),
//         )
//       ),
//     );

    
//   }
// }


import 'package:flutter/material.dart';

import '../../../models/restaurants.dart';


class RestaurantsListView extends StatelessWidget {
  final List<Restaurant> restaurants;

  const RestaurantsListView({Key? key, required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (BuildContext context, int index) {
        final restaurant = restaurants[index];
        return Card(
          child: ListTile(
            title: Text(restaurant.name),
            subtitle: Text(restaurant.label),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Navigate to restaurant details page
            },
          ),
        );
      },
    );
  }
}
