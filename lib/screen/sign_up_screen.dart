import 'package:flutter/material.dart';
import 'package:food_sharing/controller/user_manager.dart';
import 'package:food_sharing/models/user_model.dart';
import 'package:food_sharing/utils/custom_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signup() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      final user = User(
        email: _emailController.text,
        password: _passwordController.text,
      );
      await UserManager.saveUser(user);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User signed up successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInputField(
              labelText: 'Email',
              hintText: 'Enter your email',
              controller: _emailController,
            ),
            CustomInputField(
              labelText: 'Password',
              hintText: 'Enter your password',
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signup,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
