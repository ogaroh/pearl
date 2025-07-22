class Item {
  final String id;
  final String title;
  final DateTime timestamp;
  final bool? favorite;
  final String? tag;

  Item({
    required this.id,
    required this.title,
    required this.timestamp,
    this.favorite,
    this.tag,
  });

  // from json
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      timestamp: DateTime.parse(json['timestamp']),
      favorite: json['favorite'],
      tag: json['tag'], // Default tag if not provided
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
      'tag': tag.toString().split('.').last,
    };
  }

  @override
  String toString() {
    return 'Item(id: $id, title: $title, timestamp: $timestamp, favorite: $favorite)';
  }
}
