
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TabletLayout.dart';
import 'MobileLayout.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout, required this.tabletLayout, required this.desktopLayout
  });


  final WidgetBuilder  mobileLayout, tabletLayout , desktopLayout ;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //ما قبل الهبد
      builder: (BuildContext context, BoxConstraints constraints) {
        if(constraints.maxWidth < 500 ){
          return  mobileLayout(context);
        }
         else if (constraints.maxWidth < 950){
          return  tabletLayout(context);

        }else{
          return  desktopLayout(context);

        }

      },
    );
  }
}
