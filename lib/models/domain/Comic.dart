// https://developer.marvel.com/documentation/entity_types
// -> Comics

import 'package:marvel_flutter/models/common/Image.dart';

class Comic {
  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String modified;
  String isbn;
  String upc;
  String diamondCode;
  String ean;
  String issn;
  String format;
  int pageCount;
  List<TextObjects> textObjects;
  Image thumbnail;
  String resourceURI;
  // List<Url> urls
  // ResourceList+a series
  // XXX variants
  // XXX collections
  // XXX collectedIssues
  // XXX dates
  // XXX prices
  // XXX images
  // ResourceList+a creators
  // ResourceList+a characters
  // ResourceList+a stories
  // ResourceList+a events

  Comic(
      {this.id,
        this.digitalId,
        this.title,
        this.issueNumber,
        this.variantDescription,
        this.description,
        this.modified,
        this.isbn,
        this.upc,
        this.diamondCode,
        this.ean,
        this.issn,
        this.format,
        this.pageCount,
        this.textObjects,
        this.thumbnail,
        this.resourceURI});

  Comic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'];
    variantDescription = json['variantDescription'];
    description = json['description'];
    modified = json['modified'];
    isbn = json['isbn'];
    upc = json['upc'];
    diamondCode = json['diamondCode'];
    ean = json['ean'];
    issn = json['issn'];
    format = json['format'];
    pageCount = json['pageCount'];
    if (json['textObjects'] != null) {
      textObjects = new List<TextObjects>();
      json['textObjects'].forEach((v) { textObjects.add(new TextObjects.fromJson(v)); });
    }
    thumbnail = json['thumbnail'] != null ? new Image.fromJson(json['thumbnail']) : null;
    resourceURI = json['resourceURI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digitalId'] = this.digitalId;
    data['title'] = this.title;
    data['issueNumber'] = this.issueNumber;
    data['variantDescription'] = this.variantDescription;
    data['description'] = this.description;
    data['modified'] = this.modified;
    data['isbn'] = this.isbn;
    data['upc'] = this.upc;
    data['diamondCode'] = this.diamondCode;
    data['ean'] = this.ean;
    data['issn'] = this.issn;
    data['format'] = this.format;
    data['pageCount'] = this.pageCount;
    if (this.textObjects != null) {
      data['textObjects'] = this.textObjects.map((v) => v.toJson()).toList();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    data['resourceURI'] = this.resourceURI;
    return data;
  }
}

class TextObjects {
  String type;
  String language;
  String text;

  TextObjects({this.type, this.language, this.text});

  TextObjects.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    language = json['language'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['language'] = this.language;
    data['text'] = this.text;
    return data;
  }
}

/*
{
id: 2088,
digitalId: 0,
title: "Official Handbook of the Marvel Universe (2004) #14 (FANTASTIC FOUR)",
issueNumber: 14,
variantDescription: "FANTASTIC FOUR",
description: "At last, Marvel's First Family gets the OHOTMU treatment! This Official Handbook contains in-depth bios on the family, friends and foes of the Fantastic Four - from Annihilus to the Watcher! Plus: An all-new cover by superstar artist Tom Grummett, digitally painted by Morry Hollowell! <br>48 PGS./T+ Suggested for Teens and Up ...$3.99 <br> <br>",
modified: "-0001-11-30T00:00:00-0500",
isbn: "",
upc: "5960605677-00111",
diamondCode: "",
ean: "",
issn: "",
format: "Comic",
pageCount: 0,
textObjects: [
{
type: "issue_solicit_text",
language: "en-us",
text: "At last, Marvel's First Family gets the OHOTMU treatment! This Official Handbook contains in-depth bios on the family, friends and foes of the Fantastic Four - from Annihilus to the Watcher! Plus: An all-new cover by superstar artist Tom Grummett, digitally painted by Morry Hollowell! <br>48 PGS./T+ Suggested for Teens and Up ...$3.99 <br> <br>"
}
],
resourceURI: "http://gateway.marvel.com/v1/public/comics/2088",
urls: [],
series: {},
variants: [ ],
collections: [ ],
collectedIssues: [ ],
dates: [],
prices: [],
thumbnail: {},
images: [],
creators: {},
characters: {},
stories: {},
events: {}
},
*/
