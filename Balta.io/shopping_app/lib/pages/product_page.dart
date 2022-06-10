import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String brand;
  final String image;
  final String description;
  final double price;

  const ProductPage({
    Key? key,
    required this.title,
    required this.brand,
    required this.image,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white.withOpacity(0),
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0.0,
              expandedHeight: 490.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Hero(
                  tag: image,
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("by $brand"),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Text(
                "Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(description)
            )
          ],
        ),
      ),
    );
  }
}