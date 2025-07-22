// dummy json string for testing
import 'dart:convert';

const String dummyJsonString = '''
[
  {
    "id": "1",
    "title": "Item 1",
    "timestamp": "2024-10-01T12:00:00Z",
    "tag": "New"
  }, 
  {
    "id": "2",
    "title": "Item 2",
    "timestamp": "2024-10-02T12:00:00Z",
    "tag": "Old"
  },  
  {
    "id": "3",
    "title": "Item 3",
    "timestamp": "2024-10-03T12:00:00Z",
    "tag": "Hot"
  },  
  {
    "id": "4",
    "title": "Item 4",
    "timestamp": "2024-10-04T12:00:00Z",
    "tag": "Hot"
  },
  {
    "id": "5",
    "title": "Item 5",
    "timestamp": "2024-10-05T12:00:00Z",
    "tag": "New"
  },
  {
    "id": "6",
    "title": "Item 6",
    "timestamp": "2024-10-06T12:00:00Z",
    "tag": "Old"
  },
  {
    "id": "7",
    "title": "Item 7",
    "timestamp": "2024-10-07T12:00:00Z",
    "tag": null
  },
  {
    "id": "8",
    "title": "Item 8",
    "timestamp": "2024-10-08T12:00:00Z",
    "tag": null
  }
]
''';


final dummyJson = json.decode(dummyJsonString) as List<dynamic>;
