import 'package:flutter/material.dart';

import '../../domain/entities/home_item.dart';

class HomeItemsListView extends StatelessWidget {
  const HomeItemsListView({super.key, required this.items});

  final List<HomeItem> items;

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.green,
      child: Column(
        children: [
          Center(
            child: Text('List'),
          ),
        ],
      ),
    );
  }
}
