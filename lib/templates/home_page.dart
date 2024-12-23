import 'package:flutter/material.dart';
import 'package:shoe_mart_app/templates/body_page.dart';
import 'package:shoe_mart_app/templates/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = [
    const BodyPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(
            () {
              currentPage = value;
            },
          );
        },
        currentIndex: currentPage,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        selectedItemColor: Colors.amber,
        selectedIconTheme: const IconThemeData(fill: 0.1),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              label: "")
        ],
      ),
    );
  }
}
