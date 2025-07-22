import 'package:pearl/data/models/item.dart';
import 'package:pearl/data/services/api_service.dart';

class ItemRepository {
  final ApiService apiService = ApiService();

  // This is where you would define your methods for accessing item data
  Future<List<Item>> fetchItems() async {
    return apiService.fetchItems();
  }

  // fetch items by id
  Future<Item> fetchItemById(String id) async {
    return apiService.fetchItemById(id);
  }

  // add to favorites
  Future<void> toggleFavorite(String id) async {}
}
