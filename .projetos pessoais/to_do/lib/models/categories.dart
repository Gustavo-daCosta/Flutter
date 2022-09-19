import 'package:flutter/material.dart';

class Categorie {
  final String name;
  final IconData icon;
  final Color? color;

  Categorie({
    required this.name,
    required this.icon,
    required this.color,
  });
}

final List<Categorie> categories = [
  Categorie(
    name: "Work",
    color: Colors.brown[700]!,
    icon: Icons.work_rounded,
  ),
  Categorie(
    name: "Study",
    color: Colors.indigo,
    icon: Icons.school,
  ),  
  Categorie(
    name: "Sports",
    color: Colors.greenAccent[700]!,
    icon: Icons.directions_bike,
  ),
  Categorie(
    name: "Social",
    color: Colors.yellow.shade800,
    icon: Icons.person_add_alt_rounded,
  ),
  Categorie(
    name: "Health",
    color: Colors.red[800]!,
    icon: Icons.local_hospital,
  ),
];