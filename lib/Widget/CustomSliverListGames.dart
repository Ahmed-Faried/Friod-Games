import 'package:flutter/cupertino.dart';

import '../Model/ListGamesModels.dart';
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
          padding: const EdgeInsets.only(bottom: 14),
          child: CardListGames(
              gameName: list[index].gameName,
              heightScore: list[index].heightScoreGame,
              imageGame: list[index].imageGame),
        );
      },
    );
  }
}
