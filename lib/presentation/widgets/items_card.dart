import 'package:flutter/material.dart';
import '../../data/models/item.dart';

class ItemsCard extends StatelessWidget {
  final Item item;
  const ItemsCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.title),
        subtitle: Text(item.timestamp.toString()),
        trailing: item.favorite == true ? Icon(Icons.star, color: Colors.amber) : null,
      ),
    );
  }
}
