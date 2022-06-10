import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              child: productList(context),
            ),
          ),
          Container(
            color: Colors.black12,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text("Total"),
                      const SizedBox(height:5,),
                      Text(
                        "\$4250",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5)
                    ),
                  ),
                  margin: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    child: Text(
                      "Checkout",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onPressed: () => {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


Widget productList(context) {
  return ListView(
    children: <Widget>[
      ProductItem(
        context,
        title: "Nike Dry-Fit Long Sleeve",
        image: "assets/product-10.png",
        price: 150,
      ),
      ProductItem(
        context,
        title: "BeoPlay Speaker",
        image: "assets/product-1.png",
        price: 755,
      ),
      ProductItem(
        context,
        title: "Leather Wristwatch",
        image: "assets/product-2.png",
        price: 450,
      ),
      ProductItem(
        context,
        title: "Smart Bluetooth Speaker",
        image: "assets/product-3.png",
        price: 900,
      ),
      ProductItem(
        context,
        title: "Smart Luggage",
        image: "assets/product-4.png",
        price: 1000,
      ),
    ],
  );
}

class ProductItem extends StatelessWidget {
  final String title;
  final String image;
  final int price;

  const ProductItem(BuildContext context, {
    Key? key,
    required this.title,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title),
                Text(
                  "\$$price",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).textTheme.button?.color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    )
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: TextButton(
                          child: const Text(
                            "+",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () => {},
                        ),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: TextButton(
                          child: const Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () => {},
                        ),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: TextButton(
                          child: const Text(
                            "-",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () => {},
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
