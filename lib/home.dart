import 'package:flutter/material.dart';
import 'package:carselling/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      // body: const Center(
      //   child: Text('Welcome to the Home Page'),
      // ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              // MaterialPageRoute(builder: (context) => const Signup()),
            );
          },
          child: const Text('Buy Now'),
        ),
      ),
    );
  }
}
