import 'package:flutter/material.dart';
import 'package:food_sharing/controller/food_manager.dart';
import 'package:food_sharing/models/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  void _addMeal() {
    if (_nameController.text.isNotEmpty && _priceController.text.isNotEmpty) {
      final meal = Meal(
        name: _nameController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
      );
      DataManager.addMeal(meal);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Meal")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Meal Name"),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: "Meal Price"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _addMeal, child: const Text("Add Meal")),
          ],
        ),
      ),
    );
  }
}
