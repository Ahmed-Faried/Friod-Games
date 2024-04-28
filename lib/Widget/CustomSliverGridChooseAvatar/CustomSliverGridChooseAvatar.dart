import 'package:flutter/material.dart';

import '../../Components/const.dart';
import '../../generated/assets.dart';

class CustomChooseSliverGridAvatar extends StatefulWidget {
  @override
  _CustomChooseSliverGridAvatarState createState() => _CustomChooseSliverGridAvatarState();
}

class _CustomChooseSliverGridAvatarState extends State<CustomChooseSliverGridAvatar> {

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8.0),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: AvatarValues.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border: indexs == index
                    ? Border.all(color: Colors.black, width: 5)
                    : Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(100),
                color: Colors.transparent,
              ),
              child: Image.asset(AvatarValues[index]),
            ),
            onTap: () {
              if (AvatarValues[index] == Assets.imagesSoonBlack) {
                chooseAvatar = false;
              } else {
                chooseAvatar = true;
                setState(() {
                  indexs = index;
                  print(AvatarValues[index]);
                });
              }
            },
          );
        },
      ),
    );
  }
}
