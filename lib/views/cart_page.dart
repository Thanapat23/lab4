import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab4/models/food.dart';
import 'package:lab4/models/food_shop.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  final TextEditingController money = TextEditingController();
  int getMoney = 0;

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<FoodShop>();
    food.quntity--;
    shop.removeItemFromCart(food);
  }

  void removedata(BuildContext context) {
    final shop = context.read<FoodShop>();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                side: BorderSide(color: Colors.black, width: 3)),
            title: const Text(
              'ลบรายการ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text(
              'คุณต้องการลบรายการทั้งหมดใช่หรือไม่',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child:
                    const Text('ไม่ใช่', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text(
                  'ใช่',
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  shop.removeAll();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

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
                  appBar: AppBar(
                    title: const Text('สรุปรายการ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    backgroundColor: const Color.fromARGB(255, 254, 246, 127),
                    foregroundColor: Colors.black,
                    centerTitle: true,
                    actions: [
                      if (context.watch<FoodShop>().userCart.isNotEmpty)
                        IconButton(
                            onPressed: () => removedata(context),
                            icon: const Icon(Icons.delete))
                    ],
                  ),
                  backgroundColor: const Color.fromARGB(255, 255, 252, 236),
                  body: WillPopScope(
                    onWillPop: onWillPop,
                    child: ListView.builder(
                      itemCount: value.foodShop.length,
                      itemBuilder: (context, index) {
                        final Food cartFood = value.foodShop[index];
                        return Column(
                          children: [
                            if (cartFood.quntity > 0)
                              ListTile(
                                title: Text(cartFood.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    '${cartFood.price} x ${cartFood.quntity}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                trailing: IconButton(
                                    onPressed: () =>
                                        removeFromCart(cartFood, context),
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                      size: 30,
                                    )),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: context
                          .watch<FoodShop>()
                          .userCart
                          .isNotEmpty
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                side:
                                    BorderSide(color: Colors.black, width: 2)),
                            backgroundColor: Colors.grey[400],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'คิดเงิน',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: ((BuildContext context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return AlertDialog(
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 252, 236),
                                      title: const Center(
                                          child: Text('สรุปราคา',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          side: BorderSide(
                                              color: Colors.black, width: 4)),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Center(
                                                        child: Text('ทั้งหมด',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)))),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                        '${context.watch<FoodShop>().foodShop.map((e) => e.quntity * e.price).reduce((value, element) => value + element)} บาท',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Center(
                                                        child: Text('รับเงินมา',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)))),
                                                Expanded(
                                                    child: Center(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    height: 40,
                                                    child: TextField(
                                                      style: const TextStyle(
                                                          fontSize: 20),
                                                      decoration: InputDecoration(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10,
                                                                  left: 20),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                      controller: money,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                          RegExp(r'[0-9]'),
                                                        ),
                                                      ],
                                                      onChanged: (value) =>
                                                          setState(() {
                                                        if (money.text == '') {
                                                          getMoney = 0;
                                                        } else {
                                                          getMoney = (money
                                                                          .text !=
                                                                      ''
                                                                  ? int.parse(
                                                                      money
                                                                          .text)
                                                                  : 0) -
                                                              context
                                                                  .read<
                                                                      FoodShop>()
                                                                  .foodShop
                                                                  .map((e) =>
                                                                      e.quntity *
                                                                      e.price)
                                                                  .reduce((value,
                                                                          element) =>
                                                                      value +
                                                                      element);
                                                        }
                                                      }),
                                                    ),
                                                  ),
                                                ))
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Center(
                                                  child: Text('ทอนเงิน',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )),
                                                Expanded(
                                                    child: Center(
                                                  child: Text('$getMoney บาท',
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                )),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      width: 230,
                                                      child: Image.asset(
                                                        'asset/qrCode.jpg',
                                                      )),
                                                  SizedBox(
                                                      width: 230,
                                                      child: Image.asset(
                                                        'asset/qrcode2.jpg',
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        Center(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(15),
                                                        ),
                                                        side: BorderSide(
                                                            color: Colors.black,
                                                            width: 2)),
                                                backgroundColor:
                                                    Colors.red[300],
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black87),
                                              )),
                                        )
                                      ],
                                    );
                                  });
                                }));
                          },
                        )
                      : null),
            ));
  }
}
