import 'package:flutter/material.dart';
import 'package:stage_1/model/cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _showSnackbar(BuildContext context, String itemName) {
    final snackBar = SnackBar(
      content: Text("$itemName headphone has been removed from cart."),
      backgroundColor: Colors.green[800],
      duration: const Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final ProductTile productTile = ProductTile(
    itemName: 'Sample',
    itemPrice: '0.00',
    itemPath: 'images/sample.png',
    color: Colors.red,
    onPressed: () {},
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.grey[800]),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade100,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: cartState.cartItems.length,
            itemBuilder: (context, index) {
              final product = cartState.cartItems[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7,
                            spreadRadius: 5,
                            offset: const Offset(0, 3),
                            color: Colors.black.withOpacity(0.05))
                      ],
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 20, right: 0),
                    leading: Image.asset(
                      product[2],
                      height: 36,
                    ),
                    title: Text(product[0]),
                    subtitle: Text('\$${product[1]}'),
                    trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          setState(() {
                            cartState.removeItemFromCart(index);
                          });
                          _showSnackbar(context, product[0]);
                        }),
                  ),
                ),
              );
            },
          )),
          Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue.shade100,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(color: Colors.brown[600]),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '\$${cartState.calculateTotal()}',
                          style: TextStyle(
                              color: Colors.brown[900],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () => {
                        if (cartState.cartItems.isNotEmpty)
                          {Navigator.pushNamed(context, '/checkout')}
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.brown.shade800)),
                        child: const Row(
                          children: [
                            Text(
                              'Purchase',
                              style: TextStyle(color: Colors.brown),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.brown,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
