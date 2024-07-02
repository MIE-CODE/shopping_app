import 'package:flutter/material.dart';

import 'package:stage_1/screens/cart_page.dart';
import 'package:stage_1/screens/home_page.dart';
import 'package:stage_1/screens/intro_page.dart';
import 'package:stage_1/screens/successful_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/intro',
      routes: {
        '/': (context) => const HomePage(),
        '/intro': (context) => const IntroPage(),
        '/cart': (context) => const CartPage(),
        '/checkout': (context) => const SuccessfulPage()
      },
    ),
  );
}
