import 'dart:convert';
import 'dart:io';
import 'package:food_sharing/models/user_model.dart';

class UserManager {
  static const _fileName = 'user.json';

  // Helper method to get the file path (manually specifying the directory)
  static Future<File> _getUserFile() async {
    // Manually specify the file path for Android or iOS
    // For Android, it could be something like this:
    // final path = '/storage/emulated/0/Download/$_fileName';  // Path on Android storage
    // For iOS, you might want to use the app's documents folder
    // final path = '/path/to/some/directory/$_fileName';  // For iOS (or specify a hardcoded path)

    const path =
        '/FOOD_SHARING/assets/$_fileName'; // Hardcoded path, needs to be modified based on platform
    return File(path);
  }

  // Save user to the JSON file
  static Future<void> saveUser(User user) async {
    final file = await _getUserFile();

    // Create the file if it doesn't exist
    if (!await file.exists()) {
      await file.create(recursive: true);
    }

    List<User> users = [];
    if (await file.exists()) {
      users = await getUsers(); // Read existing users
    }

    users.add(user); // Add the new user

    final usersJson = users.map((u) => u.toJson()).toList();
    await file.writeAsString(
        json.encode(usersJson)); // Write updated users to the file
  }

  // Retrieve all users from the JSON file
  static Future<List<User>> getUsers() async {
    final file = await _getUserFile();

    if (!await file.exists()) {
      return []; // Return an empty list if the file doesn't exist
    }

    final usersJson =
        await file.readAsString(); // Read the JSON string from the file
    final List users = json.decode(usersJson); // Decode the JSON into a list

    return users
        .map((e) => User.fromJson(e))
        .toList(); // Map the JSON list to User objects
  }

  // Find a user by email and password
  static Future<User?> findUser(String email, String password) async {
    final users = await getUsers();

    try {
      return users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      return null; // Return null if the user isn't found
    }
  }
}
