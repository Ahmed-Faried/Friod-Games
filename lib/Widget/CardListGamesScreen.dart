import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game1/utils/app_styles.dart';

import '../generated/assets.dart';
import 'ImageGame.dart';
import 'TextGameDetiles.dart';

class CardListGames extends StatelessWidget {

  const CardListGames({
    super.key,
    required this.gameName,
    required this.heightScore,
    required this.imageGame

  });
  final String gameName ;
  final String heightScore ;
  final String imageGame ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

            gradient:       gameName == "Soon" ?
            LinearGradient(
              colors: [
                Color(0xe6fc2172),
                Color(0xf2fbbc05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )
             :
            LinearGradient(
              colors: [
                Color(0xffFC2172),
                Color(0xffFBBC05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )
      ),


      child:
      gameName == "Soon" ?
      Container(
        height: 135,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Soon", style: AppStyles.StyleRegular64,),

          ],
        ),
      )
          :
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(

            flex: 1,
            child: ImageGame(imageGame: imageGame,),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.0),
              child: TextGameDetilse(gameName: gameName , heightScore: "Height Score : ${heightScore}",),
            ),
          )
        ],
      )

    );
  }
}

