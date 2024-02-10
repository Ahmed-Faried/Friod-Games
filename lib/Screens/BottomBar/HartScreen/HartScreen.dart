import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game1/generated/assets.dart';

import '../../../Widget/CustomAppBar/CustomAppBar.dart';

class HartScreen extends StatelessWidget {
  const HartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff6D5ED2),
      appBar: CustomAppBar(titile: "Soon",Pop :true),
      body: Center(child: SvgPicture.asset(Assets.imagesSoonPage2)),
    );
  }
}
