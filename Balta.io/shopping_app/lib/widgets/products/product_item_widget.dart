import 'package:flutter/material.dart';
import '../../pages/product_page.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String brand;
  final String image;
  final double price;

  const ProductItem(BuildContext context, {
    Key? key,
    required this.title,
    required this.brand,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      width: 170,
      //height: 170,
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(context) => ProductPage(
                    title: title,
                    brand: brand,
                    image: image,
                    description: "Nike Dri-FIT is a polyester fabric designed to help you keep dry sou you can more comfortably work harder and longer.",
                    price: price,
                  ),
                )
              );
            },
            child: Hero(
              tag: image,
                child: Image.asset(
                image,
                width: 170,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 45,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            brand,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "\$ $price",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
