import 'package:flutter/material.dart';
import 'package:lab4/models/food.dart';
import 'package:lab4/models/food_shop.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FoodTile extends StatefulWidget {
  final Food food;
  const FoodTile({super.key, required this.food});

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  int quantity = 0;
  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      quantity = quantity <= 0 ? 0 : quantity - 1;
    });
  }

  void addToCart() {
    final food = context.read<FoodShop>();
    widget.food.quntity++;
    food.addItemToCart(widget.food, quantity);
  }

  void removToCart() {
    if (widget.food.quntity > 0) {
      final food = context.read<FoodShop>();
      widget.food.quntity--;
      food.removeItemFromCart(widget.food);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(
            255,
            254,
            250,
            192,
          ),
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          widget.food.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${widget.food.price} B',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: Image.asset(widget.food.imagePath),
        trailing: Wrap(
          spacing: 5,
          children: [
            Container(
              width: 40,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey[400]),
              child: IconButton(
                onPressed: () {
                  decrement();
                  removToCart();
                },
                icon: const Icon(
                  Icons.remove,
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${widget.food.quntity}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: 40,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey[400]),
              child: IconButton(
                onPressed: () {
                  increment();
                  addToCart();
                },
                icon: const Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Image.asset(food.imagePath)