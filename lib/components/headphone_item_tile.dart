// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeadphoneItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final dynamic color;
  void Function()? onPressed;

  HeadphoneItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemPath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 7,
              spreadRadius: 5,
              offset: const Offset(0, 3),
              color: Colors.black.withOpacity(0.05))
        ], color: color[100], borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              itemPath,
              height: 100,
            ),
            Text(
              itemName,
              style: TextStyle(
                  fontFamily: 'nato sans',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700]),
            ),
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                '\$$itemPrice',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
