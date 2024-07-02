import 'package:flutter/material.dart';
import 'package:stage_1/components/headphone_item_tile.dart';
import 'package:stage_1/model/cart_model.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductTile productTile = ProductTile(
    itemName: 'Sample',
    itemPrice: '0.00',
    itemPath: 'images/sample.png',
    color: Colors.red,
    onPressed: () {},
  );

  void _showSnackbar(BuildContext context, String itemName) {
    final snackBar = SnackBar(
      content: Text("$itemName headphone has been added to your cart."),
      backgroundColor: Colors.green[800],
      duration: const Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 48,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text('Shopping Arcade'),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "Let's order best headphones for you ",
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900]),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'New Sales',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: productTile.shopItems.length,
            itemBuilder: (context, index) {
              final product = productTile.shopItems[index];
              return HeadphoneItemTile(
                itemName: product[0],
                itemPrice: product[1],
                itemPath: product[2],
                color: product[3],
                onPressed: () {
                  setState(() {
                    cartState.addItemToCart(product);
                  });
                  _showSnackbar(context, product[0]);
                },
              );
            },
          ),
        )
      ],
    );
  }
}
