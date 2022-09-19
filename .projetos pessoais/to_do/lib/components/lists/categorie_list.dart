import 'package:flutter/material.dart';
import 'package:to_do/models/categories.dart';

Widget categoriesList(int index) {
  final Categorie categorie = categories[index];
  return Container(
    padding: const EdgeInsets.all(3),
    width: 180,
    child: ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1.5,
          color: Colors.grey[600]!,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      dense: true,
      title: Text(
        categorie.name,
        style: const TextStyle(fontSize: 22),
      ),
      subtitle: LinearProgressIndicator(
        value: 30,
        color: categorie.color,
      ),
      leading: Icon(
        categorie.icon,
        color: categorie.color,
      ),
    ),
  );
}