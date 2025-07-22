import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String favoritesKey = 'favorites';

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(favoritesKey) ?? [];
  }

  Future<void> toggleFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(favoritesKey) ?? [];
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    await prefs.setStringList(favoritesKey, favorites);
  }

  Future<bool> isFavorite(String id) async {
    final favorites = await getFavorites();
    return favorites.contains(id);
  }
}
