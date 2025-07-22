import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/item.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/items/items_bloc.dart';
import '../blocs/items/items_event.dart';

class ItemsCard extends StatelessWidget {
  final Item item;
  const ItemsCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMEd().format(item.timestamp),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            if (item.tag != null && item.tag!.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: ItemsCard.tagColor(item.tag!),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item.tag!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            item.favorite == true ? Icons.star : Icons.star_border,
            color: item.favorite == true ? Colors.amber : Colors.grey,
          ),
          onPressed: () {
            BlocProvider.of<ItemsBloc>(context).add(ToggleFavorite(item.id));
          },
        ),
      ),
    );
  }

  static Color tagColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'new':
        return Colors.blue;
      case 'old':
        return Colors.blueGrey;
      case 'hot':
        return Colors.red;
      default:
        return Colors.grey.shade600;
    }
  }
}
