import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/model/characters_repo.dart';

class CharactersAPI {
  final http.Client _client;
  static const String _baseUrl = "https://rickandmortyapi.com/api/character";

  CharactersAPI({http.Client? httpClient})
      : _client = httpClient ?? http.Client();

  Future<CharactersRepo> getCharacters({String url = _baseUrl}) async {
    final Uri uri = Uri.parse(url);
    final response = await _client.get(uri);

    if (response.statusCode != 200) throw CharactersFetchFailure();

    final json = jsonDecode(response.body);
    final charactersRepo = CharactersRepo.fromJson(json);
    return charactersRepo;
  }
}

class CharactersFetchFailure implements Exception {}
