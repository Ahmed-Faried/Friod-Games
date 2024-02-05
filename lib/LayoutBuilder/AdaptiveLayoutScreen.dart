import 'package:flutter/material.dart';

import 'AdaptiveLayout.dart';
import 'DeskTopLayout.dart';
import 'MobileLayout.dart';
import 'TabletLayout.dart';
import '../Network/local/shared_preferences.dart';
import '../Screens/BottomBar/HomePageScreen/HomePageScreen.dart';
import '../Screens/ChooseAvatar/ChooseAvatar.dart';
import '../Screens/Signin/SignInScreen.dart';


class AdaptiveLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget widget ;

    var signInScreen  = CacheHelper.getData(key:'signInScreen') ;
    var Name  = CacheHelper.getData(key:'Name') ;
    var Age  = CacheHelper.getData(key:'Age') ;
    if(signInScreen != null ){
      widget = ChooseAvatar();

      //
      if(Name == null && Age == null ){
        widget = ChooseAvatar();

      }else{
        widget = HomePageScreen();

      }
      //
      // else{
      //   if(department == null ){
      //     widget = HomePagePatientScreen();
      //   }else{
      //     widget = HomePageDoctorScreen();
      //   }
      // }
    }

    else{
      widget = SignInScreen();
    }
    // TODO: implement build

    return AdaptiveLayout(
      mobileLayout:(context) =>  widget  , //const MobileLayoutScreen(),
      tabletLayout: (context) => const TabletLayout(),
      desktopLayout: (context) => const DesktopLayout(),
    );
  }
}
