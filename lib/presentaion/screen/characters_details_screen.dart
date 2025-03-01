import 'package:flutter/material.dart';
import 'package:rickandmorty/data/models/characters.dart';

import '../../constants/myColors.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;
  CharactersDetailsScreen({super.key, required this.character});
  late double screenHeight;
  late double screenWidth;
  double endIndent = 250;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.myGrey,
        body: CustomScrollView(
          slivers: [
            buildSliverAppBar(),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo("Species: ", character.species),
                    buildDivider(250),
                    character.type.isEmpty
                        ? Container()
                        : characterInfo("Type: ", character.type),
                    character.type.isEmpty ? Container() : buildDivider(270),
                    characterInfo("Origin: ", character.origin),
                    buildDivider(265),
                    characterInfo("Gender: ", character.gender),
                    buildDivider(252),
                    characterInfo("Status: ", character.status),
                    buildDivider(260),
                    characterInfo("Episodes: ", episodeNumbers().join(" / ")),
                  ],
                ),
              ),
              SizedBox(
                height: 600,
              ),
            ])),
          ],
        ),
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: TextStyle(
              color: MyColors.myYellow,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            height: screenHeight,
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      endIndent: endIndent,
      thickness: 2,
      height: 30,
    );
  }

  List<int> episodeNumbers() {
    try {
      var urls = character.episode;
      return urls.map((url) {
        List<String> parts = url.split("/"); // Split the URL by "/"
        return int.parse(parts.last); // Convert the last part to int
      }).toList(); // Convert the iterable to a List
    } catch (e) {
      print(e.toString());
      return []; // Ensure the function always returns a value
    }
  }
}
