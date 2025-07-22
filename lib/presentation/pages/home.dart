import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/items/items_bloc.dart';
import '../blocs/items/items_event.dart';
import '../blocs/items/items_state.dart';
import '../widgets/items_card.dart';
import '../widgets/search_bar.dart' as custom;
import '../../data/repositories/items_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ItemsBloc _itemsBloc;

  @override
  void initState() {
    super.initState();
    _itemsBloc = ItemsBloc(ItemsRepository());
    _itemsBloc.add(FetchItems());
  }

  @override
  void dispose() {
    _itemsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (_) => _itemsBloc,
        child: Column(
          children: [
            custom.SearchBar(
              onChanged: (query) {
                _itemsBloc.add(SearchItems(query));
              },
            ),
            Expanded(
              child: BlocBuilder<ItemsBloc, ItemsState>(
                builder: (context, state) {
                  if (state is ItemsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ItemsLoaded) {
                    if (state.items.isEmpty) {
                      return Center(child: Text('No items found.'));
                    }
                    return RefreshIndicator.adaptive(
                      onRefresh: () async => _itemsBloc.add(FetchItems()),
                      child: ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          return ItemsCard(item: state.items[index]);
                        },
                      ),
                    );
                  } else if (state is ItemsError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return Center(child: Text('Search or fetch items.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
