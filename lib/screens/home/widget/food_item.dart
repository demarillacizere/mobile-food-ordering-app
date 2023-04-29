import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../models/food.dart';

class FoodItem extends StatelessWidget {
  final Food food;
  FoodItem(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(child: Card(
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
                          Text(food.name,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text(food.price.toString() + " Rwf",
                              style: TextStyle(
                                  fontSize: 14.0),)
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
                          const Text("2", style: TextStyle(fontSize: 18.0)),
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
              ),);
  }
}
