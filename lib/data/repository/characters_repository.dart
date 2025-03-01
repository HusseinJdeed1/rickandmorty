import 'package:rickandmorty/data/models/characters.dart';

import '../web_services/characters_web_service.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getCharacters() async {
    final characters = await charactersWebServices.getCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
