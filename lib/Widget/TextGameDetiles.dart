import 'package:flutter/material.dart';

class TextGameDetilse extends StatelessWidget {
  const TextGameDetilse({
    super.key,
    required this.gameName,
    required this.heightScore ,

  });

  final String gameName ;
  final String  heightScore ;
  @override
  Widget build(BuildContext context ) {
    return Container(
      height: 150,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$gameName"),
            Text("$heightScore"),

          ],
        ),
      ),
    );
  }
}
