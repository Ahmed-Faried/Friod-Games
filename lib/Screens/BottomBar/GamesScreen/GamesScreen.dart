import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game1/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/ListGamesModels.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../../Widget/CardListGamesScreen.dart';
import '../../../Widget/CustomAppBar/CustomAppBar.dart';
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

    int? score = CacheHelper.getData(key: "high_scoreGame1") ;
    if (score == null) {
      score = 0;
      // return score.toString();
    }
    final  List<ListGamesModel> Games = [
      ListGamesModel(gameName: 'Game1', heightScoreGame: "${score}", imageGame: Assets.imagesSoonCircle),
      ListGamesModel(gameName: 'Game2', heightScoreGame: "2000", imageGame: Assets.imagesSoonCircle),
      ListGamesModel(gameName: 'Soon', heightScoreGame: "3000", imageGame: Assets.imagesSoonCircle),
      ListGamesModel(gameName: 'Soon', heightScoreGame: "2000", imageGame: Assets.imagesSoonCircle),
    ];


    return Scaffold(
      backgroundColor: Color(0xff6D5ED2),
      appBar: CustomAppBar(Titile: "Games", Pop: false,),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CustomSliverListGames(list: Games,),
      ),
    );
  }
}


