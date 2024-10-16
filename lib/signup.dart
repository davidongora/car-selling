import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'car_store.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('signup'),
          backgroundColor: Colors.orange,
        ),
        body: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: SignForm(),
        ));
  }
}

class SignForm extends StatelessWidget {
  const SignForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
            decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          label: const Text(
            'FullName',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        )),
        const SizedBox(height: 20),
        // const Text(
        //   "data",
        //   style: TextStyle(color: Colors.black),
        // ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              // prefixIcon: const Icon(Icons.password),
              prefixIcon: const Icon(Icons.lock),
              label: const Text('password'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Phone Number is required'; // Marks it as required
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: '0112027035',
              suffixIcon: const Icon(Icons.phone),
              label: const Text('Phone Number'),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
        ),

        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color.fromARGB(255, 10, 10, 10),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.symmetric(
                    horizontal: 50, vertical: 200), // Centered vertically
                duration: Duration(seconds: 2),
                content: Text(
                  'moving to the home page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CarStore()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 140),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('sign up', style: TextStyle(color: Colors.white)))
      ],
    ));
  }
}
