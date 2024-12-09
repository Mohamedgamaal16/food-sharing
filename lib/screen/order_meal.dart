import 'package:flutter/material.dart';
import 'package:food_sharing/controller/food_manager.dart';
import 'package:food_sharing/models/meal_model.dart';
import 'package:food_sharing/models/order_model.dart';
import 'package:food_sharing/screen/my_order_scree.dart';

class OrderMealScreen extends StatefulWidget {
  const OrderMealScreen({super.key});

  @override
  State<OrderMealScreen> createState() => _OrderMealScreenState();
}

class _OrderMealScreenState extends State<OrderMealScreen> {
  void _addOrder(Meal meal) {
    final order = Order.fromMeal(meal);
    DataManager.addOrder(order);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final meals = DataManager.getMeals();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Meal"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyOrdersScreen()),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return ListTile(
            title: Text(meal.name),
            subtitle: Text("Price: \$${meal.price}"),
            trailing: ElevatedButton(
              onPressed: () => _addOrder(meal),
              child: const Text("Order"),
            ),
          );
        },
      ),
    );
  }
}
