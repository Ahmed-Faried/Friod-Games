
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../generated/assets.dart';

class ImageGame extends StatelessWidget {
  const ImageGame({
    super.key,
    required this.imageGame
  });
final String imageGame ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.yellow,
      child: FittedBox(
        child: SvgPicture.asset(imageGame,),
        fit: BoxFit.fill,
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
