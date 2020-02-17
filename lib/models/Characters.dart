import 'package:marvel_flutter/models/Comics.dart';
import 'package:marvel_flutter/models/Events.dart';
import 'package:marvel_flutter/models/Images.dart';
import 'package:marvel_flutter/models/Series.dart';
import 'package:marvel_flutter/models/Stories.dart';
import 'package:marvel_flutter/models/Urls.dart';

// https://developer.marvel.com/documentation/entity_types
// -> Characters
class Characters {
  int id;
  String name;
  String description;
  String modified;
  Images thumbnail;
  String resourceURI;
  // Comics comics;
  // Series series;
  // Stories stories;
  // Events events;
  // Urls urls;

  Characters(
      {this.id,
        this.name,
        this.description,
        this.modified,
        this.thumbnail,
        this.resourceURI});

  Characters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? new Images.fromJson(json['thumbnail'])
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
