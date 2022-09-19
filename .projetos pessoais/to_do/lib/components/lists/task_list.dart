import 'package:flutter/material.dart';
import 'package:to_do/models/categories.dart';

Widget taskList(BuildContext context, int index) {
  final Categorie categorie = categories[index];

  return ListTile(
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 0.5,
        color: Colors.grey[600]!,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    title: Text("${categorie.name} task"),
    subtitle: Text("${categorie.name} task subtitle"),
    leading: Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        // padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: categorie.color!,
          ),
        ),
        child: Icon(
          categorie.icon,
          color: categorie.color,
        ),
      ),
    ),
    trailing: Icon(
      Icons.edit,
      color: Theme.of(context).primaryColor,
    ),
  );
}