import 'package:curved_drawer/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curved Drawer',
      home: const Home(),
      theme: ThemeData(colorSchemeSeed: Colors.blue[900]),
      debugShowCheckedModeBanner: false,
    );
  }
}
