import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/model/character.dart';
import 'package:test_app/model/characters_info.dart';
import 'package:test_app/model/episode.dart';

class APIService {
  static final http.Client _client = http.Client();
  static const String _baseCharacterUrl =
      "https://rickandmortyapi.com/api/character";
  static const String _baseEpisodeUrl =
      "https://rickandmortyapi.com/api/episode";

  APIService._();

  static Future<Map<String, dynamic>> getCharacters(
      {String url = _baseCharacterUrl}) async {
    final json = await _makeRequest(url);
    final Map<String, dynamic> response = {};
    response['info'] = CharactersInfo.fromJson(json['info']);
    response['characters'] = List<Character>.from((json['results'] as Iterable)
        .map((e) => Character.fromJson(e)));
    return response;
  }

  static Future<List<Episode>> getEpisodes(List<String> urls) async {
    final String concatRequestUrl = _concatEpisodesUrl(urls);
    Iterable json = await _makeRequest(concatRequestUrl);
    List<Episode> episodes =
        List<Episode>.from(json.map((e) => Episode.fromJson(e)));
    return episodes;
  }

  static Future<dynamic> _makeRequest(String url) async {
    final uri = Uri.parse(url);
    final response = await _client.get(uri);
    if (response.statusCode != 200) throw APIRequestFailure();
    final json = jsonDecode(response.body);
    return json;
  }

  static String _concatEpisodesUrl(List<String> urls) {
    String concatUrl = _baseEpisodeUrl;
    bool first = true;
    for (String url in urls) {
      if (first) {
        concatUrl += '/' + url.split('/').last;
        first = false;
      } else {
        concatUrl += ',' + url.split('/').last;
      }
    }
    return concatUrl;
  }
}

class APIRequestFailure implements Exception {}
