enum Tag { old, hot, cold }

class Item {
  final String id;
  final String title;
  final DateTime timestamp;
  final bool favorite;

  Item({
    required this.id,
    required this.title,
    required this.timestamp,
    required this.favorite,
  });

  // from json
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      timestamp: DateTime.parse(json['timestamp']),
      favorite: json['favorite'],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'timestamp': timestamp
          .toIso8601String(), // Convert DateTime to ISO 8601 string
      'favorite': favorite,
    };
  }

  @override
  String toString() {
    return 'Item(id: $id, title: $title, timestamp: $timestamp, favorite: $favorite)';
  }
}
