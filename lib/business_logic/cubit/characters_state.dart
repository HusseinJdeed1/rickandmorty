import 'package:flutter/material.dart';
import 'package:rickandmorty/data/models/characters.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharacterLoaded extends CharactersState {
  final List<Character> characters;

  CharacterLoaded(this.characters);
}
