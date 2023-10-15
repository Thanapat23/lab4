import 'package:flutter/material.dart';
import 'package:lab4/models/food.dart';
import 'package:lab4/models/food_shop.dart';
import 'package:lab4/widget/food_tile.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;

      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodShop>(
        builder: (context, value, child) => SafeArea(
              child: Scaffold(
                backgroundColor: const Color.fromARGB(255, 255, 252, 236),
                appBar: AppBar(
                  title: const Text('M E N U'),
                  backgroundColor: const Color.fromARGB(255, 254, 246, 127),
                  foregroundColor: Colors.black,
                  centerTitle: true,
                ),
                body: WillPopScope(
                  onWillPop: onWillPop,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Text(
                          'Select menu',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: value.foodShop.length,
                            itemBuilder: (context, index) {
                              Food eachFood = value.foodShop[index];
                              return FoodTile(food: eachFood);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
