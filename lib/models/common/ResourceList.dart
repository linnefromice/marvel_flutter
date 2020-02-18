import 'package:marvel_flutter/models/common/Item.dart';

// https://developer.marvel.com/documentation/entity_types
// -> Resource Lists
class ResourceList {
  int available;
  String collectionURI;
  List<Item> items;
  int returned;

  ResourceList(
      {this.available, this.collectionURI, this.items, this.returned});

  ResourceList.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = new List<Item>();
      json['items'].forEach((v) {
        items.add(new Item.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['returned'] = this.returned;
    return data;
  }
}