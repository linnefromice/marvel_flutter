// https://developer.marvel.com/documentation/entity_types
// -> Characters

import 'package:marvel_flutter/models/domain/Character.dart';
import 'package:marvel_flutter/models/domain/Story.dart';

class StoriesResult {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  String etag;
  Container data;

  StoriesResult(
      {this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHTML,
        this.etag,
        this.data});

  StoriesResult.fromJson(Map<String, dynamic> json) {
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
  List<Story> results;

  Container({this.offset, this.limit, this.total, this.count, this.results});

  Container.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = new List<Story>();
      json['results'].forEach((v) {
        results.add(new Story.fromJson(v));
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
