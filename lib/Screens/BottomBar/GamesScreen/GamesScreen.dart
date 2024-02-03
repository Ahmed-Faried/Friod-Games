import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game1/utils/app_styles.dart';

import '../../../Model/ListGamesModels.dart';
import '../../../Widget/CardListGamesScreen.dart';
import '../../../Widget/CustomSliverListGames.dart';
import '../../../generated/assets.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {

  @override
  Widget build(BuildContext context) {

    final  List<ListGamesModel> Games = [
      ListGamesModel(gameName: 'Game1', heightScoreGame: "1000", imageGame: Assets.imagesSoonCircle),
      ListGamesModel(gameName: 'Game2', heightScoreGame: "2000", imageGame: Assets.imagesSoonCircle),
      ListGamesModel(gameName: 'Game3', heightScoreGame: "3000", imageGame: Assets.imagesSoonCircle),
      ListGamesModel(gameName: 'Game2', heightScoreGame: "2000", imageGame: Assets.imagesSoonCircle),
      ListGamesModel(gameName: 'Game3', heightScoreGame: "3000", imageGame: Assets.imagesSoonCircle),
    ];


    return Scaffold(
      backgroundColor: Color(0xff6D5ED2),
      appBar: AppBar(
        title: Text(
          "Games",
          style: AppStyles.StyleRegular20,
        ),
        centerTitle: true,
        backgroundColor: Color(0xff6D5ED2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CustomSliverListGames(list: Games,),
      ),
    );
  }
}

