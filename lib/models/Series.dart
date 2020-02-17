import 'package:marvel_flutter/models/Characters.dart';
import 'package:marvel_flutter/models/Comics.dart';
import 'package:marvel_flutter/models/Creators.dart';
import 'package:marvel_flutter/models/Events.dart';
import 'package:marvel_flutter/models/Images.dart';
import 'package:marvel_flutter/models/Stories.dart';
import 'package:marvel_flutter/models/Urls.dart';

// https://developer.marvel.com/documentation/entity_types
// -> Series
class Series {
  int id;
  String title;
  String description;
  String resourceURI;
  int startYear;
  int endYear;
  String rating;
  String type;
  String modified;
  Images thumbnail;
  // Creators creators;
  // Characters characters;
  // Stories stories;
  // Comics comics;
  // Events events;
  // Urls urls;
  // SeriesSummary next;
  // SeriesSummary previous;

  Series(
      {this.id,
        this.title,
        this.description,
        this.resourceURI,
        this.startYear,
        this.endYear,
        this.rating,
        this.type,
        this.modified,
        this.thumbnail});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    startYear = json['startYear'];
    endYear = json['endYear'];
    rating = json['rating'];
    type = json['type'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? new Images.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['resourceURI'] = this.resourceURI;
    data['startYear'] = this.startYear;
    data['endYear'] = this.endYear;
    data['rating'] = this.rating;
    data['type'] = this.type;
    data['modified'] = this.modified;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    return data;
  }
}
