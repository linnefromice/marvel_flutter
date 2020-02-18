import 'package:marvel_flutter/models/common/Image.dart';
import 'package:marvel_flutter/models/common/Url.dart';

// https://developer.marvel.com/documentation/entity_types
// -> Characters

class CharactersResult {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  String etag;
  Container data;

  CharactersResult(
      {this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHTML,
        this.etag,
        this.data});

  CharactersResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    etag = json['etag'];
    data = json['data'] != null ? new Container.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['attributionText'] = this.attributionText;
    data['attributionHTML'] = this.attributionHTML;
    data['etag'] = this.etag;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Container {
  int offset;
  int limit;
  int total;
  int count;
  List<Character> results;

  Container({this.offset, this.limit, this.total, this.count, this.results});

  Container.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = new List<Character>();
      json['results'].forEach((v) {
        results.add(new Character.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
