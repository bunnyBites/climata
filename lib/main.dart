import 'package:climata/locator_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Climata',
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.orange,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.orange)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    LocatorBrain locator = LocatorBrain();
    locator.getCurrentPosition().then((value) => print(value.latitude));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Climata"),
        centerTitle: true,
      ),
      body: const SafeArea(child: Text("hello")),
    );
  }
}
