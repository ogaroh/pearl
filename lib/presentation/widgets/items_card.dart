import 'package:flutter/material.dart';
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
        subtitle: Text(item.timestamp.toString()),
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
}
