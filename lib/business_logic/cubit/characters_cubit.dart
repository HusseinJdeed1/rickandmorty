import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/business_logic/cubit/characters_state.dart';
import 'package:rickandmorty/data/models/characters.dart';
import 'package:rickandmorty/data/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  List<Character> getAllCharacters() {
    charactersRepository.getCharacters().then((character) {
      emit(CharacterLoaded(character));
      this.characters = character;
    });
    return characters;
  }
}
