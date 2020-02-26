// https://developer.marvel.com/documentation/entity_types
// -> Creators

import 'package:marvel_flutter/models/common/Image.dart';

class Creator {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String suffix;
  String fullName;
  String modified;
  Image thumbnail;
  String resourceURI;
  // ResourceList+a comics;
  // ResourceList+a series;
  // ResourceList+a stories;
  // ResourceList+a events;
  // List<Url> urls;

  Creator(
      {this.id,
        this.firstName,
        this.middleName,
        this.lastName,
        this.suffix,
        this.fullName,
        this.modified,
        this.thumbnail,
        this.resourceURI});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    suffix = json['suffix'];
    fullName = json['fullName'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? new Image.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['suffix'] = this.suffix;
    data['fullName'] = this.fullName;
    data['modified'] = this.modified;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    data['resourceURI'] = this.resourceURI;
    return data;
  }
}
