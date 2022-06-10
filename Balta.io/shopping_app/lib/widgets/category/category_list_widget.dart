import 'package:flutter/material.dart';
import 'category_item_widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const <Widget>[
        CategoryItem(
          imageLight: "assets/light_mode-Icons/light_bulb-green.png",
          imageDark: "assets/dark_mode-Icons/light_bulb-yellow.png",
          title: "Devices"
        ),
        CategoryItem(
          imageLight: "assets/light_mode-Icons/headphone-green.png",
          imageDark: "assets/dark_mode-Icons/headphone-yellow.png",
          title: "Gadgets"
        ),
        CategoryItem(
          imageLight: "assets/light_mode-Icons/game_controller-green.png",
          imageDark: "assets/dark_mode-Icons/game_controller-yellow.png",
          title: "Gaming"
        ),
        CategoryItem(
          imageLight: "assets/light_mode-Icons/mens_shoe-green.png",
          imageDark: "assets/dark_mode-Icons/mens_shoe-yellow.png",
          title: "Men's Shoe"
        ),
        CategoryItem(
          imageLight: "assets/light_mode-Icons/womens_shoe-green.png",
          imageDark: "assets/dark_mode-Icons/womens_shoe-yellow.png",
          title: "Women's Shoe"
        ),
        CategoryItem(
          //imageLight: "assets/light_mode-Icons/-green.png",
          //imageDark: "assets/dark_mode-Icons/-yellow.png",
          imageLight: "assets/base_icons/book_toedit.png",
          imageDark: "assets/base_icons/book_toedit.png",
          title: "Books"
        ),
      ],
    );
  }
}