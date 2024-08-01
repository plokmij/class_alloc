import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/home_item.dart';

class HomeItemsListView extends StatelessWidget {
  const HomeItemsListView({super.key, required this.items});

  final List<HomeItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 180),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final item in items) _HomeItemListItem(item: item),
        ],
      ),
    );
  }
}

class _HomeItemListItem extends StatelessWidget {
  const _HomeItemListItem({
    required this.item,
  });

  final HomeItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 20),
      color: item.color.withOpacity(0.35),
      child: InkWell(
        onTap: () {
          context.push(item.route);
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
