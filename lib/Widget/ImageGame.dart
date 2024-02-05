
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
      // height: 150,
        decoration: BoxDecoration(
          // color: Colors.yellow,


        ),
       child: SvgPicture.asset(imageGame,),
    );
  }
}
