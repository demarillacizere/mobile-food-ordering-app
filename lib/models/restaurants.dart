import 'food.dart';

class Restaurant {
  String name;
  String waittime;
  String label;
  num score;
  Map<String, List<Food>> menu;
  // ignore: avoid_types_as_parameter_names
  Restaurant(this.name, this.waittime, this.label, this.score, this.menu);

  // ignore: non_constant_identifier_names
  static List<Restaurant> generateRestaurant() {
    return [
      Restaurant('Kibandaski', '10-15 mins', 'Fast Food', 4.5, {
        'Food': Food.generateFood(),
        'Drinks': Food.generateDrinks(),
      }),
      Restaurant('Divine', '10-15 mins', 'Fast Food', 4.5, {
        'Food': Food.generateFood(),
        'Drinks': Food.generateDrinks2(),
      }),
      Restaurant('Scolars Cafe', '10-15 mins', 'Fast Food', 4.5, {
        'Food': Food.generateFood(),
        'Drinks': Food.generateDrinks(),
      }),
      Restaurant('Kibandaski', '10-15 mins', 'Fast Food', 4.5, {
        'Food': Food.generateFood(),
        'Drinks': Food.generateDrinks(),
      }),
      Restaurant('Kibandaski', '10-15 mins', 'Fast Food', 4.5, {
        'Food': Food.generateFood(),
        'Drinks': Food.generateDrinks(),
      }),
    ];
  }
}
