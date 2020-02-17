import 'package:marvel_flutter/models/Image.dart';
import 'package:marvel_flutter/models/Url.dart';

// https://developer.marvel.com/documentation/entity_types
// -> Characters
class Character {
  int id;
  String name;
  String description;
  String modified;
  Image thumbnail;
  String resourceURI;
  // ResourceList+a comics;
  // ResourceList+a series;
  // ResourceList+a stories;
  // ResourceList+a events;
  // List<Url> urls;

  Character(
      {this.id,
        this.name,
        this.description,
        this.modified,
        this.thumbnail,
        this.resourceURI});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? new Image.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['modified'] = this.modified;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    data['resourceURI'] = this.resourceURI;
    return data;
  }
}
