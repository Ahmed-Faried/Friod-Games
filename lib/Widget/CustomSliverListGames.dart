import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game1/Screens/GameOne/GameOne.dart';
import 'package:game1/generated/assets.dart';
import '../Model/ListGamesModels.dart';
import '../Screens/BottomBar/HomePageScreen/HomePageScreen.dart';
import '../Screens/GameTwo/GameTwo.dart';
import 'CardListGamesScreen.dart';

class CustomSliverListGames extends StatelessWidget {
  const CustomSliverListGames({super.key, required this.list});
  final List<ListGamesModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding:  EdgeInsets.only(bottom: 14),
          child: GestureDetector(
            onTap: (){
              if(index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GameOne()));

              }
              if(index == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GameTwo()));

              }
            },
            child: CardListGames(
                gameName: list[index].gameName,
                heightScore: list[index].heightScoreGame,
                imageGame: list[index].imageGame),
          ),
        );
      },
    );
  }
}
