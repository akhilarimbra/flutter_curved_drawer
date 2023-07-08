import 'package:curved_drawer/curved_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    for (int i = 1; i < 10; i++) {
      items.add(
        CurvedDrawerItem(
          icon: Icons.help_outline,
          title: 'Index : $i',
          onTap: () {
            setState(() {
              selectedIndex = i;
            });
          },
          index: i,
          selectedIndex: selectedIndex,
          backgroundColor: Colors.blue.shade900,
        ),
      );
    }

    return Scaffold(
      body: Row(children: [
        Expanded(
          flex: 20,
          child: CurvedDrawer(
            selectedIndex: selectedIndex,
            items: items,
            backgroundColor: Colors.blue.shade900,
          ),
        ),
        Expanded(flex: 100, child: Container()),
      ]),
    );
  }
}
