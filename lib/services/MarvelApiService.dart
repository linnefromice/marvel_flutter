import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:marvel_flutter/models/CharactersResult.dart';
import 'package:marvel_flutter/models/ComicsResult.dart';
import 'package:marvel_flutter/models/CreatorsResult.dart';
import 'package:marvel_flutter/models/EventsResult.dart';
import 'package:marvel_flutter/models/SeriesResult.dart';
import 'package:marvel_flutter/models/StoriesResult.dart';
import 'package:marvel_flutter/models/domain/Character.dart';

class MarvelApiService {
  static final baseUrl = "https://gateway.marvel.com/v1/public";
  static final characters = "characters";
  static final comics = "comics";
  static final creators = "creators";
  static final events = "events";
  static final series = "series";
  static final stories = "stories";

  static final ts = "1";
  static final publicKey = "2897bec72a68cf322e6f4cba8b778ada";
  static final privateKey = "bf160c108eb8eeb10ce41dc61973e1efe6ec162c";

  static final idIronMan = "1009368";


  static Digest _calcHash() {
    final bytes = utf8.encode(ts + privateKey + publicKey);
    return md5.convert(bytes);
  }

  static String _createUrl(final String entity, final String id) {
    if (id == null) {
      return _createUrlWithoutId(entity);
    } else {
      final String url = baseUrl + "/" + entity;
      final String queryString = "ts=" + ts + "&apikey=" + publicKey + "&hash=" + _calcHash().toString();
      return url + "/" + id + "?" + queryString;
    }
  }

  static String _createUrlWithoutId(final String entity) {
    final String url = baseUrl + "/" + entity;
    final String queryString = "ts=" + ts + "&apikey=" + publicKey + "&hash=" + _calcHash().toString();
    return url + "?" + queryString;
  }

  static Future<Map<String, dynamic>> _fetchDatas(final url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      throw Exception('Failed to fetchDatas');
    }
  }

  static Future<CharactersResult> fetchCharacters() async {
    // TODO: modify logic (now sample logic)
    final response = await _fetchDatas(_createUrlWithoutId(characters) + "&nameStartsWith=Iron%20Man");
    return CharactersResult.fromJson(response);
  }

  static Future<Character> fetchRandomCharacter() async {
    // TODO: modify logic (now sample logic)
    final totalData = 1493; // LOW: Hard coding (use data from api)
    final offsetNum = Random().nextInt(totalData);
    final response = await _fetchDatas(_createUrlWithoutId(characters) + "&offset=" + offsetNum.toString() + "&limit=1");
    final result = CharactersResult.fromJson(response);
    return result.data.results[0];
  }

  static Future<ComicsResult> fetchComics() async {
    // TODO: modify logic (now sample logic)
    final response = await _fetchDatas(_createUrlWithoutId(comics));
    return ComicsResult.fromJson(response);
  }

  static Future<CreatorsResult> fetchCreators() async {
    // TODO: modify logic (now sample logic)
    final response = await _fetchDatas(_createUrlWithoutId(creators));
    return CreatorsResult.fromJson(response);
  }

  static Future<EventsResult> fetchEvents() async {
    // TODO: modify logic (now sample logic)
    final response = await _fetchDatas(_createUrlWithoutId(events));
    return EventsResult.fromJson(response);
  }

  static Future<SeriesResult> fetchSeries() async {
    // TODO: modify logic (now sample logic)
    final response = await _fetchDatas(_createUrlWithoutId(series));
    return SeriesResult.fromJson(response);
  }

  static Future<StoriesResult> fetchStories() async {
    // TODO: modify logic (now sample logic)
    final response = await _fetchDatas(_createUrlWithoutId(stories));
    return StoriesResult.fromJson(response);
  }
}