import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:food_sharing/models/meal_model.dart';
import 'package:food_sharing/models/order_model.dart';

class DataManager {
  static List<Meal> meals = [];
  static List<Order> orders = [];
  DataManager() {
    loadInitialData();
  }
  static Future<void> loadInitialData() async {
    // Load initial data (optional, e.g., from JSON file or local storage)
    final String response = await rootBundle.loadString('assets/meals.json');
    print("dkfjsaljfhgsbkdjf,ns.df/adf");
    print(response);
    final List<dynamic> data = json.decode(response);
    meals = data.map((item) => Meal.fromJson(item)).toList();
  }

  static void addMeal(Meal meal) {
    meals.add(meal);
  }

  static void addOrder(Order order) {
    orders.add(order);
  }

  static List<Meal> getMeals() {
    return meals;
  }

  static List<Order> getOrders() {
    return orders;
  }
}
