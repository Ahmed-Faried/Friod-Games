import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game1/utils/app_styles.dart';
import 'package:lordicon/lordicon.dart';
import 'Game1(2024)/home.dart';
import 'Screens/ChooseAvatar.dart';
import 'generated/assets.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var controller = IconController.assets(Assets.iconsGoldIcon3);
    int cont = 1 ;

    controller.addStatusListener((status) {
      if ( status == ControllerStatus.completed && cont < 2) {
        cont++ ;
        controller.playFromBeginning();
      }
      if ( status == ControllerStatus.ready ) {
        controller.play();

      }
    });
    return MaterialApp(
      title: '2048',
      theme: ThemeData(

          primarySwatch: Colors.blue,
          fontFamily: 'StarJedi'
      ),
      home: AnimatedSplashScreen(
        splash: Column(
          children: [
            SizedBox(height: 135,),

            Text("Froid Games" , style: AppStyles.StyleBold40,),
            SizedBox(height: 25,),
            IconViewer(
              controller: controller,
              width: 140,
              height: 140,
            ),
          ],
        ),
        nextScreen: ChooseAvatar(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor:  Color(0xff53489A),//53489A //6D5ED2
        splashIconSize: 500,
        duration: 1000,
      )
      ,
      debugShowCheckedModeBanner: false,
    );
  }
}


