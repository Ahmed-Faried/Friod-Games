import 'package:flutter/material.dart';

import '../LayoutBuilder/AdaptiveLayout.dart';
import '../LayoutBuilder/DeskTopLayout.dart';
import '../LayoutBuilder/MobileLayout.dart';
import '../LayoutBuilder/TabletLayout.dart';
import '../Screens/Signin/SignInScreen.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AdaptiveLayout(
      mobileLayout:(context) =>  SignInScreen()  , //const MobileLayoutScreen(),
      tabletLayout: (context) => const TabletLayout(),
      desktopLayout: (context) => const DesktopLayout(),
    );
  }
}
