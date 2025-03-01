import 'package:flutter/material.dart';
import 'package:rickandmorty/constants/myColors.dart';
import 'package:rickandmorty/constants/strings.dart';
import 'package:rickandmorty/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: MyColors.myWhite, borderRadius: BorderRadius.circular(8)),
      child: Container(
        color: MyColors.myGrey,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, charactersDetailsScreen,
              arguments: character),
          child: GridTile(
            footer: Hero(
              tag: character.id,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.black54,
                alignment: Alignment.bottomCenter,
                child: Text(
                  character.name,
                  style: TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: "assets/images/empty_image.gif",
                    image: character.image,
                    fit: BoxFit.cover,
                  )
                : Image.asset("assets/images/empty_image.gif"),
          ),
        ),
      ),
    );
  }
}
