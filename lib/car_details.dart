import 'package:flutter/material.dart';

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Modal Dialog'),
                  content: const Text('This is the content of the modal.'),
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

void main() {
  runApp(const MaterialApp(home: DialogExample()));
}
