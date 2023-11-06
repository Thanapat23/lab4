import 'package:flutter/material.dart';

import 'food.dart';

class FoodShop extends ChangeNotifier {
  //food for sale list
  List<Food> _shop = [
    Food(
        name: 'ย่าง (จาน)',
        price: 50,
        imagePath: "asset/kangmoo.jpg",
        quntity: 0),
    Food(
        name: 'แหนม (จาน)', price: 30, imagePath: "asset/naem.jpg", quntity: 0),
    Food(
        name: 'แหนม (ห่อ)', price: 10, imagePath: "asset/naem.jpg", quntity: 0),
    Food(
        name: 'แสงโสม (กลม)',
        price: 320,
        imagePath: "asset/sangsomk.jpeg",
        quntity: 0),
    Food(
        name: 'แสงโสม (แบน)',
        price: 170,
        imagePath: "asset/sangsomb.jpeg",
        quntity: 0),
    Food(
        name: 'หงส์ทอง (กลม)',
        price: 280,
        imagePath: "asset/hongtongk.jpeg",
        quntity: 0),
    Food(
        name: 'แสงโสม (แบน)',
        price: 160,
        imagePath: "asset/hongtongb.jpeg",
        quntity: 0),
    Food(
        name: 'เบียร์สิงห์',
        price: 70,
        imagePath: "asset/singha.jpeg",
        quntity: 0),
    Food(
        name: 'เบียร์ลีโอ', price: 65, imagePath: "asset/leo.jpeg", quntity: 0),
    Food(
        name: 'เบียร์ช้าง',
        price: 65,
        imagePath: "asset/chang.jpeg",
        quntity: 0),
    Food(name: 'โซดา', price: 15, imagePath: "asset/soda.jpeg", quntity: 0),
    Food(
        name: 'น้ำอัดลม', price: 15, imagePath: "asset/fanta.jpeg", quntity: 0),
    Food(name: 'น้ำแข็ง', price: 10, imagePath: "asset/ice.jpg", quntity: 0),
    Food(name: 'น้ำเปล่า', price: 5, imagePath: "asset/water.jpeg", quntity: 0),
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

  void removeAll() {
    _userCart = [];
    _shop = [
      Food(
          name: 'ย่าง (จาน)',
          price: 50,
          imagePath: "asset/kangmoo.jpg",
          quntity: 0),
      Food(
          name: 'แหนม (จาน)',
          price: 30,
          imagePath: "asset/naem.jpg",
          quntity: 0),
      Food(
          name: 'แหนม (ห่อ)',
          price: 10,
          imagePath: "asset/naem.jpg",
          quntity: 0),
      Food(
          name: 'แสงโสม (กลม)',
          price: 320,
          imagePath: "asset/sangsomk.jpeg",
          quntity: 0),
      Food(
          name: 'แสงโสม (แบน)',
          price: 170,
          imagePath: "asset/sangsomb.jpeg",
          quntity: 0),
      Food(
          name: 'หงส์ทอง (กลม)',
          price: 280,
          imagePath: "asset/hongtongk.jpeg",
          quntity: 0),
      Food(
          name: 'แสงโสม (แบน)',
          price: 160,
          imagePath: "asset/hongtongb.jpeg",
          quntity: 0),
      Food(
          name: 'เบียร์สิงห์',
          price: 70,
          imagePath: "asset/singha.jpeg",
          quntity: 0),
      Food(
          name: 'เบียร์ลีโอ',
          price: 65,
          imagePath: "asset/leo.jpeg",
          quntity: 0),
      Food(
          name: 'เบียร์ช้าง',
          price: 65,
          imagePath: "asset/chang.jpeg",
          quntity: 0),
      Food(name: 'โซดา', price: 15, imagePath: "asset/soda.jpeg", quntity: 0),
      Food(
          name: 'น้ำอัดลม',
          price: 15,
          imagePath: "asset/fanta.jpeg",
          quntity: 0),
      Food(name: 'น้ำแข็ง', price: 10, imagePath: "asset/ice.jpg", quntity: 0),
      Food(
          name: 'น้ำเปล่า',
          price: 5,
          imagePath: "asset/water.jpeg",
          quntity: 0),
    ];
    notifyListeners();
  }
}
