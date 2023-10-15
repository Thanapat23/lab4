import 'package:flutter/material.dart';

import 'food.dart';

class FoodShop extends ChangeNotifier {
  //food for sale list
   List<Food> _shop = [
    Food(name: 'Moo Yang', price: 50, imagePath: "asset/mooyang.jpg",quntity: 0),
    Food(name: 'Kang Moo Yang', price: 55, imagePath: "asset/kangmoo.jpg",quntity: 0),
    Food(name: 'Sam Chan Yang', price: 60, imagePath: "asset/samchan.jpg",quntity: 0),
    Food(name: 'Lin Moo Yang', price: 45, imagePath: "asset/linmoo.jpg",quntity: 0),
    Food(name: 'Sai Yang', price: 40, imagePath: "asset/saiyang.jpg",quntity: 0),
    Food(name: 'Naem', price: 30, imagePath: "asset/naem.jpg",quntity: 0),
  ];
  //user cart
  List<Food> _userCart = [];
  //get food list
  List<Food> get foodShop => _shop;
  //get user cart
  List<Food> get userCart => _userCart;
  //get quntity
  //add item cart
  void addItemToCart(Food food, int quntity) {
    
    _userCart.add(food);

    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Food food) {
    _userCart.remove(food);
    notifyListeners();
  }

  void removeAll(){
    _userCart = [];
    _shop = [
    Food(name: 'Moo Yang', price: 50, imagePath: "asset/mooyang.jpg",quntity: 0),
    Food(name: 'Kang Moo Yang', price: 55, imagePath: "asset/kangmoo.jpg",quntity: 0),
    Food(name: 'Sam Chan Yang', price: 60, imagePath: "asset/samchan.jpg",quntity: 0),
    Food(name: 'Lin Moo Yang', price: 45, imagePath: "asset/linmoo.jpg",quntity: 0),
    Food(name: 'Sai Yang', price: 40, imagePath: "asset/saiyang.jpg",quntity: 0),
    Food(name: 'Naem', price: 30, imagePath: "asset/naem.jpg",quntity: 0),
  ];
    notifyListeners();
  }
}
