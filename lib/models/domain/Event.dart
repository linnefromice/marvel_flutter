// https://developer.marvel.com/documentation/entity_types
// -> Events

import 'package:marvel_flutter/models/common/Image.dart';
import 'package:marvel_flutter/models/common/Url.dart';

class Event {
  int id;
  String title;
  String description;
  String resourceURI;
  List<Url> urls;
  String modified;
  String start;
  String end;
  Image thumbnail;
  // ResourceList+a creators;
  // ResourceList+a characters;
  // ResourceList+a stories;
  // ResourceList+a comics;
  // ResourceList+a series;
  // SeriesSummary next;
  // SeriesSummary previous;

  Event(
      {this.id,
        this.title,
        this.description,
        this.resourceURI,
        this.urls,
        this.modified,
        this.start,
        this.end,
        this.thumbnail});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls = new List<Url>();
      json['urls'].forEach((v) {
        urls.add(new Url.fromJson(v));
      });
    }
    modified = json['modified'];
    start = json['start'];
    end = json['end'];
    thumbnail = json['thumbnail'] != null
        ? new Image.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['resourceURI'] = this.resourceURI;
    if (this.urls != null) {
      data['urls'] = this.urls.map((v) => v.toJson()).toList();
    }
    data['modified'] = this.modified;
    data['start'] = this.start;
    data['end'] = this.end;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    return data;
  }
}

