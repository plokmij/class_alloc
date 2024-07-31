import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.trailing,
      required this.onTap});

  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      elevation: 0,
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: trailing,
      ),
    );
  }
}