import 'package:pearl/data/services/api_service.dart';

import '../models/item.dart';

class ItemsRepository {
  final ApiService apiService = ApiService();
  Future<List<Item>> fetchItems() async {
    return apiService.fetchItems();
  }
}
