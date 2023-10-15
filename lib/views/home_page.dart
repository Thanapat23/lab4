import 'package:flutter/material.dart';
import 'package:lab4/views/cart_page.dart';
import 'package:lab4/views/menu_page.dart';
import 'package:lab4/widget/bottom_navbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectIndex = 0;
  void navigateBottom(int index){
    setState(() {
      selectIndex = index;
    });
  }

  final List<Widget> pages = [
    const MenuPage(),
    const MyCartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectIndex],
        bottomNavigationBar: BottomNavbar(onTabChange: (index) => navigateBottom(index)),
      ),
    );
  }
}