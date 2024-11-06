import 'package:carselling/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:carselling/login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  var box = await Hive.openBox('myBox');
  // var box = await Hive.openBox<String>('myBox'); // initilize to store only strings
  var b = Hive.box('myBox');
  print(b.name);
  print(b.path);

  b.put("myName", "david"); //stored in key value pairs
  b.put('id', 1);
  b.put('languanges', ["eng", "kis", "mat", "dart"]);

  b.putAll({"kenya": "nairobi", "Uganda": "kampala", "tanzania": "daresalam"});

  print(b.keys);
  print("the keys are, ${b.keys}");
  print(b.values);
  print(b.length);
  print(b.get("name"));

  print(b.get("x", defaultValue: "hello world"));

  b.put("myName", "john"); //update
  b.delete("myName");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var helloEnv = '${dotenv.env['App_name']}';
    print(helloEnv);

    return const MaterialApp(
      title: 'Splash Screen Demo',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds before moving to the next page
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpeg', width: 100),
            const SizedBox(height: 20),
            const Text(
              'CarSelling',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
