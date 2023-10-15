import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lab4/views/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const MyHomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 250, 223),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'G R A N D M A ’ S',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'R E S T A U R A N T',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'asset/logo.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
