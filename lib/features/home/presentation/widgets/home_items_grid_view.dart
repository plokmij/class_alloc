import 'package:flutter/material.dart';

import '../../domain/entities/home_item.dart';

class HomeItemsGridView extends StatelessWidget {
  const HomeItemsGridView({super.key, required this.items});

  final List<HomeItem> items;

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.red,
    );
  }
}
