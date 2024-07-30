import 'package:flutter/material.dart';

class HomeItem {
  final String title;
  final IconData icon;
  final Color color;
  final String route;

  const HomeItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.route,
  });
}

enum ListingMode {
  grid,
  list;
}
