import 'package:food_sharing/models/meal_model.dart';

class Order {
  final String name;
  final double price;

  Order({required this.name, required this.price});

  factory Order.fromMeal(Meal meal) {
    return Order(
      name: meal.name,
      price: meal.price,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
}
