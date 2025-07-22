import 'package:flutter_bloc/flutter_bloc.dart';
import 'items_event.dart';
import 'items_state.dart';
import '../../../data/models/item.dart';
import '../../../data/repositories/items_repository.dart';
import '../../../data/services/local_storage_service.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final ItemsRepository itemsRepository;
  final localStorage = LocalStorageService();

  List<Item> _allItems = [];

  ItemsBloc(this.itemsRepository) : super(ItemsInitial()) {
    on<FetchItems>(_onFetchItems);
    on<SearchItems>(_onSearchItems);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<ItemsState> emit,
  ) async {
    await localStorage.toggleFavorite(event.id);
    final favorites = await localStorage.getFavorites();
    _allItems = _allItems
        .map((item) => item.copyWith(favorite: favorites.contains(item.id)))
        .toList();
    emit(ItemsLoaded(_allItems));
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
