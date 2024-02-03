import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          color: Colors.grey
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}

