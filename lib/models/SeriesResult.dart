import 'package:marvel_flutter/models/common/Image.dart';
import 'package:marvel_flutter/models/common/Url.dart';

// https://developer.marvel.com/documentation/entity_types
// -> Series
class SeriesResult {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  String etag;
  Container data;

  SeriesResult(
      {this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHTML,
        this.etag,
        this.data});

  SeriesResult.fromJson(Map<String, dynamic> json) {
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
  List<Series> results;

  Container({this.offset, this.limit, this.total, this.count, this.results});

  Container.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = new List<Series>();
      json['results'].forEach((v) {
        results.add(new Series.fromJson(v));
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
  Image thumbnail;
  // ResourceList+a creators;
  // ResourceList+a characters;
  // ResourceList+a stories;
  // ResourceList+a comics;
  // ResourceList+a events;
  // List<Url> urls;
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
        ? new Image.fromJson(json['thumbnail'])
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
