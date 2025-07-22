import 'package:pearl/data/services/api_service.dart';

import '../models/item.dart';

class ItemsRepository {
  final ApiService apiService = ApiService();
  Future<List<Item>> fetchItems() async {
    // TODO: Replace with actual data source
    await Future.delayed(Duration(seconds: 3));
    return apiService.fetchItems();
  }
}
