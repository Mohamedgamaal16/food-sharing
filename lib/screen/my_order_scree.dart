import 'package:flutter/material.dart';
import 'package:food_sharing/controller/food_manager.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = DataManager.getOrders();

    return Scaffold(
      appBar: AppBar(title: const Text("My Orders")),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text(order.name),
            subtitle: Text("Price: \$${order.price}"),
          );
        },
      ),
    );
  }
}
