// https://developer.marvel.com/documentation/entity_types
// -> Stories

import 'package:marvel_flutter/models/common/Image.dart';

class Story {
  int id;
  String title;
  String description;
  String resourceURI;
  String type;
  String modified;
  Image thumbnail;
  OriginalIssue originalIssue;
  // ResourceList+a creators;
  // ResourceList+a characters;
  // ResourceList+a series;
  // ResourceList+a comics;
  // ResourceList+a events;

  Story(
      {this.id,
        this.title,
        this.description,
        this.resourceURI,
        this.type,
        this.modified,
        this.thumbnail,
        this.originalIssue});

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    type = json['type'];
    modified = json['modified'];
    thumbnail = json['thumbnail'];
    originalIssue = json['originalIssue'] != null
        ? new OriginalIssue.fromJson(json['originalIssue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['resourceURI'] = this.resourceURI;
    data['type'] = this.type;
    data['modified'] = this.modified;
    data['thumbnail'] = this.thumbnail;
    if (this.originalIssue != null) {
      data['originalIssue'] = this.originalIssue.toJson();
    }
    return data;
  }
}

class OriginalIssue {
  String resourceURI;
  String name;

  OriginalIssue({this.resourceURI, this.name});

  OriginalIssue.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    return data;
  }
}