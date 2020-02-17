import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

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
  static final private_key = "XXXX";

  static final id_iron_man = "1009368";


  static Digest _calcHash() {
    final bytes = utf8.encode(ts + private_key + public_key);
    return md5.convert(bytes);
  }

  static String _createUrl(final String entity, final String code) {
    String url = base_url + "/" + entity;
    String queryString = "ts=" + ts + "&apikey=" + public_key + "&hash=" + _calcHash().toString();
    if (code == null) {
      return url + "?" + queryString;
    } else {
      return url + "/" + code + "?" + queryString;
    }
  }

  static Future fetchCharacters() async {
    // TODO: modify logic (now sample logic)
    final url = _createUrl(characters, id_iron_man);
    final response = await http.get(url);
    print(json.decode(response.body));
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

  static Future fetchSeries() async {
    // TODO: add logic
  }

  static Future fetchStories() async {
    // TODO: add logic
  }
}