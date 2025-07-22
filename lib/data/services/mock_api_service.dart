import 'package:pearl/data/models/item.dart';
import 'package:pearl/data/services/dummy_data.dart';

class MockApiService {
  // Mock API service methods
  Future<List<Item>> fetchItems() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return (dummyJson).map((item) => Item.fromJson(item)).toList();
  }

  Future<Item> fetchItemById(String id) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return (dummyJson)
        .map((item) => Item.fromJson(item))
        .firstWhere((item) => item.id == id);
  }
}
