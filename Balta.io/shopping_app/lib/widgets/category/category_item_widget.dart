import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imageLight;
  final String imageDark;
  final String title;
  
  const CategoryItem({
    Key? key,
    required this.imageLight,
    required this.imageDark,
    required this.title,
  }) : super(key: key);


  // CategoryItem({required this.imagePath})

  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
      Container(
        width: 70,
        height: 70,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(64),
          ),
        ),
        child: Theme.of(context).brightness == Brightness.light ? 
        Image.asset(imageLight) :
        Image.asset(imageDark)
      ),
      Text(
        title,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    ]
  );
  }
}