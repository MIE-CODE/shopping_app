import 'package:flutter/material.dart';

class ProductTile {
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final Color color;
  void Function()? onPressed;

  ProductTile(
      {required this.itemName,
      required this.itemPrice,
      required this.itemPath,
      required this.color,
      required this.onPressed});

  final List<List<dynamic>> _shopItems = [
    ["Apple", "1000.00", "images/apple.png", Colors.green],
    ["Jbl", "60.00", "images/jbl.png", Colors.yellow],
    ["Sony", "20.00", "images/sony.png", Colors.brown],
    ["Ikf", "300.00", "images/ikf.png", Colors.blue],
    ["Gaming", "500.00", "images/gaming.png", Colors.indigo],
    ["Bose", "50000000.00", "images/bose.png", Colors.red],
    ["Bowers", "5900.00", "images/Bowers.png", Colors.orange],
    ["Epos", "1000000.00", "images/Epos.png", Colors.grey],
  ];

  final List<List<dynamic>> _cartItems = [];

  List<List<dynamic>> get shopItems => _shopItems;
  List<List<dynamic>> get cartItems => _cartItems;

  void addItemToCart(List<dynamic> item) {
    _cartItems.add(item);
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}

class CartState {
  final List<List<dynamic>> _cartItems = [];

  List<List<dynamic>> get cartItems => _cartItems;

  void addItemToCart(List<dynamic> product) {
    _cartItems.add(product);
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
  }

  void clearCart() {
    _cartItems.clear();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}

final cartState = CartState();
