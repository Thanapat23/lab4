import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lab4/models/food_shop.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BottomNavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
        backgroundColor: const Color.fromARGB(255, 254, 246, 127),
        mainAxisAlignment: MainAxisAlignment.center,
        gap: 8,
        color: Colors.black87,
        activeColor: Colors.black,
        hoverColor: Colors.grey,
        tabBackgroundColor: const Color.fromARGB(255, 247, 223, 4),
        tabBorderRadius: 30,
        padding: const EdgeInsets.all(15),
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          const GButton(
            icon: Icons.list_alt_rounded,
            iconSize: 35,
            text: 'Menu',
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GButton(
            icon: Icons.shopping_cart,
            iconSize: 35,
            text: 'Cart',
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            leading: badges.Badge(
                showBadge: context.watch<FoodShop>().userCart.length > 0,
                position: badges.BadgePosition.topEnd(top: -10, end: -1),
                badgeContent: Text('${context.watch<FoodShop>().userCart.length}'),
                child: Icon(
                  Icons.shopping_cart,
                  size: 35,
                )),
          ),
        ]);
  }
}
