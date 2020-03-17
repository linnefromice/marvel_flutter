import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MovieService {
  static Future<String> _loadJsonFile() async {
    return rootBundle.loadString('resources/datas/movies.json');
  }

  static Future<List> selectAll() async {
    final resources = await _loadJsonFile();
    return jsonDecode(resources);
  }
}