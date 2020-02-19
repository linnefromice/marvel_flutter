import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:marvel_flutter/models/CharactersResult.dart';
import 'package:marvel_flutter/models/SeriesResult.dart';
import 'package:marvel_flutter/models/domain/Character.dart';

class MarvelApiService {
  static final base_url = "https://gateway.marvel.com/v1/public";
  static final characters = "characters";
  static final comics = "comics";
  static final creators = "creators";
  static final events = "events";
  static final series = "series";
  static final stories = "stories";

  static final ts = "1";
  static final public_key = "2897bec72a68cf322e6f4cba8b778ada";
  static final private_key = "bf160c108eb8eeb10ce41dc61973e1efe6ec162c";

  static final id_iron_man = "1009368";


  static Digest _calcHash() {
    final bytes = utf8.encode(ts + private_key + public_key);
    return md5.convert(bytes);
  }

  static String _createUrl(final String entity, final String id) {
    if (id == null) {
      return _createUrlWithoutId(entity);
    } else {
      final String url = base_url + "/" + entity;
      final String queryString = "ts=" + ts + "&apikey=" + public_key + "&hash=" + _calcHash().toString();
      return url + "/" + id + "?" + queryString;
    }
  }

  static String _createUrlWithoutId(final String entity) {
    final String url = base_url + "/" + entity;
    final String queryString = "ts=" + ts + "&apikey=" + public_key + "&hash=" + _calcHash().toString();
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

  static Future fetchComics() async {
    // TODO: add logic
  }

  static Future fetchCreators() async {
    // TODO: add logic
  }

  static Future fetchEvents() async {
    // TODO: add logic
  }

  static Future<SeriesResult> fetchSeries() async {
    // TODO: modify logic (now sample logic)
    final response = await _fetchDatas(_createUrlWithoutId(series));
    return SeriesResult.fromJson(response);
  }

  static Future fetchStories() async {
    // TODO: add logic
  }
}