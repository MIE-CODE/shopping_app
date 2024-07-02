import 'package:flutter/material.dart';
import 'package:stage_1/model/cart_model.dart';
import 'package:stage_1/screens/home_page.dart';

class SuccessfulPage extends StatelessWidget {
  const SuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            cartState.clearCart();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          },
          label: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              size: 68,
              color: Colors.green.shade400,
            ),
            Text(
              'Order Successful',
              style: TextStyle(fontSize: 24, color: Colors.green.shade700),
            )
          ],
        ),
      ),
    );
  }
}
