import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/products/product_item_widget.dart';

class ProductList extends StatelessWidget {
  final Axis scrollDirection;

  const ProductList({
    Key? key,
    required this.scrollDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection, 
      children: <Widget>[
        ProductItem(
          context,
          title: "Nike Dry-Fit Long Sleeve",
          brand: "Nike",
          image: "assets/product-10.png",
          price: 150,
        ),
        ProductItem(
          context,
          title: "BeoPlay Speaker",
          brand: "Bang and Olufsen",
          image: "assets/product-1.png",
          price: 755,
        ),
        ProductItem(
          context,
          title: "Leather Wristwatch",
          brand: "Tag Heuer",
          image: "assets/product-2.png",
          price: 450,
        ),
        ProductItem(
          context,
          title: "Smart Bluetooth Speaker",
          brand: "Google Inc.",
          image: "assets/product-3.png",
          price: 900,
        ),
        ProductItem(
          context,
          title: "Smart Luggage",
          brand: "Smart Inc.",
          image: "assets/product-4.png",
          price: 1000,
        ),
      ]
    );
  }
}
