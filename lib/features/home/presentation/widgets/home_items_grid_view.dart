import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/home_item.dart';

class HomeItemsGridView extends StatelessWidget {
  const HomeItemsGridView({super.key, required this.items});

  final List<HomeItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _HomeItemGridTile(item: item);
      },
    );
  }
}

class _HomeItemGridTile extends StatelessWidget {
  const _HomeItemGridTile({
    required this.item,
  });

  final HomeItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: item.color.withOpacity(0.35),
      child: InkWell(
        onTap: () {
          context.push(item.route);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.icon,
              size: 50,
              color: item.color,
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
