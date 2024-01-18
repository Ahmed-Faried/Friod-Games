import 'package:flutter/material.dart';
import 'package:game1/Game1(2024)/LayoutBuilder/DeskTopLayout.dart';
import 'package:game1/Game1(2024)/LayoutBuilder/MobileLayout.dart';
import 'LayoutBuilder/AdaptiveLayout.dart';
import 'LayoutBuilder/TabletLayout.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AdaptiveLayout(
      mobileLayout:(context) => MobileLayoutScreen(),
      tabletLayout: (context) => TabletLayout(),
      desktopLayout: (context) => DesktopLayout(),
    );
  }
}
