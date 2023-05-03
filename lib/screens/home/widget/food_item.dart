// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// import '../../../cart_page.dart';
// import '../../../models/food.dart';
// import '../food_details_page.dart';

// class FoodItem extends StatefulWidget {
//   final Food food; // callback function
//   FoodItem({required this.food});

//   @override
//   State<FoodItem> createState() => _FoodItemState();
// }

// class _FoodItemState extends State<FoodItem> {
//   var _count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => FoodDetailsPage(
//                 food: widget.food,
//                 floatingActionButton: CartFloatingActionButton(
//                     onPressed: () => CartPage(
//                           foodDetails: {},
//                         )))));
//       },
//       child: Card(
//         color: Colors.white,
//         elevation: 8.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Row(
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Image(
//                 image: AssetImage('assets/images/orderImage.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(widget.food.name,
//                       style: TextStyle(
//                           fontSize: 18.0, fontWeight: FontWeight.bold)),
//                   Text(
//                     widget.food.price.toString() + " Rwf",
//                     style: TextStyle(fontSize: 14.0),
//                   )
//                 ],
//               ),
//             ),
//             const Spacer(),
//             // Padding(
//             //   padding: const EdgeInsets.all(8.0),
//             //   child: Row(
//             //     children: [
//             //       CircleAvatar(
//             //         radius: 15.0,
//             //         backgroundColor: Colors.grey[300],
//             //         child: IconButton(
//             //           icon: const Icon(Icons.remove, size: 15.0),
//             //           onPressed: () {
//             //             setState(() {
//             //               if (_count <= 0) {
//             //                 _count = 0;
//             //               } else {
//             //                 _count--;
//             //               }
//             //               // widget.onCountChanged(widget.food.name, _count);
//             //             });
//             //           },
//             //         ),
//             //       ),
//             //       const SizedBox(width: 10.0),
//             //       Text(_count.toString(), style: TextStyle(fontSize: 18.0)),
//             //       const SizedBox(width: 10.0),
//             //       CircleAvatar(
//             //         radius: 15.0,
//             //         backgroundColor: Colors.grey[300],
//             //         child: IconButton(
//             //           icon: const Icon(Icons.add, size: 15.0),
//             //           onPressed: () {
//             //             setState(() {
//             //               _count++;
//             //               // widget.onCountChanged(widget.food.name, _count);
//             //             });
//             //           },
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             // IconButton(
//             //   icon: const Icon(Icons.delete),
//             //   color: Colors.red,
//             //   onPressed: () {
//             //     // Delete functionality goes here
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
