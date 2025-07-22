import 'package:flutter_bloc/flutter_bloc.dart';
import 'items_event.dart';
import 'items_state.dart';
import '../../../data/models/item.dart';
import '../../../data/repositories/items_repository.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final ItemsRepository itemsRepository;
  List<Item> _allItems = [];

  ItemsBloc(this.itemsRepository) : super(ItemsInitial()) {
    on<FetchItems>(_onFetchItems);
    on<SearchItems>(_onSearchItems);
  }

  Future<void> _onFetchItems(FetchItems event, Emitter<ItemsState> emit) async {
    emit(ItemsLoading());
    try {
      _allItems = await itemsRepository.fetchItems();
      emit(ItemsLoaded(_allItems));
    } catch (e) {
      emit(ItemsError(e.toString()));
    }
  }

  void _onSearchItems(SearchItems event, Emitter<ItemsState> emit) {
    final query = event.query.toLowerCase();
    final filtered = _allItems
        .where((item) => item.title.toLowerCase().contains(query))
        .toList();
    emit(ItemsLoaded(filtered));
  }
}
