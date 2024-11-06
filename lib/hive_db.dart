import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class hiveDb extends StatefulWidget {
  const hiveDb({super.key});

  @override
  State<hiveDb> createState() => _hiveDbState();
}

class _hiveDbState extends State<hiveDb> {
  late Future<void> _initHiveFuture;

  @override
  void initState() {
    super.initState();
    _initHiveFuture = _initializeHive();
  }

  Future<void> _initializeHive() async {
    await Hive.initFlutter();
    await Hive.openBox('myBox');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initHiveFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var box = Hive.box('myBox');
          print('Box name: ${box.name}');

          return const Placeholder();
        }
      },
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: hiveDb(),
  ));
}
