import 'package:flutter/material.dart';

class SellCar extends StatelessWidget {
  const SellCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('data'),
        elevation: 0,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(
        //         right: 16.0),
        //     child: IconButton(
        //       icon: const Icon(Icons.more_vert),
        //       onPressed: () {
        //         print('Icon pressed');
        //       },
        //     ),
        //   ),
        // ],
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 100),
              child: Text(
                'Sell Your Car',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  print('clicked');
                },
              ),
            )
          ],
        ),
      ),
      body: const BuyCar(),
    );
  }
}

class BuyCar extends StatelessWidget {
  const BuyCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Dialog Example'),
      // ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Modal Dialog'),
                  content: const Text('nice to have'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}
