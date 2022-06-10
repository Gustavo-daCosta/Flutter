import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: Column(
        children: <Widget>[
          Card(),
        ],
      ),
    );
  }
}