import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/restaurants.dart';

class MenuScreen extends StatelessWidget {
  final Restaurant restaurant;

  const MenuScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: ListView.builder(
        itemCount: restaurant.menu.length,
        itemBuilder: (BuildContext context, int index) {
          final category = restaurant.menu.keys.elementAt(index);
          final items = restaurant.menu[category]!;
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
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.description),
                    trailing: Text('\$${item.price}'),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
