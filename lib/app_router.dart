import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty/constants/strings.dart';
import 'package:rickandmorty/data/models/characters.dart';
import 'package:rickandmorty/data/repository/characters_repository.dart';
import 'package:rickandmorty/data/web_services/characters_web_service.dart';
import 'package:rickandmorty/presentaion/screen/characters_details_screen.dart';
import 'package:rickandmorty/presentaion/screen/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case charactersDetailsScreen:
        final character = setting.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharactersDetailsScreen(
                  character: character,
                ));
    }
  }
}
