import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game1/Screens/BottomBar/HomePageScreen/HomePageScreen.dart';
import 'package:game1/Screens/ChooseAvatar/ChooseAvatar.dart';
import 'package:game1/Screens/Signin/SignInScreen.dart';
import 'package:game1/utils/app_styles.dart';
import 'package:lordicon/lordicon.dart';
import 'Bloc/bloc_observer.dart';
import 'Components/const.dart';
import 'LayoutBuilder/AdaptiveLayoutScreen.dart';
import 'HomePageBloc/HomePageCubit.dart';
import 'Network/local/shared_preferences.dart';
import 'Network/remote/dioHelper.dart';
import 'Test Screens ChatGPT/List Age.dart';
import 'generated/assets.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget ;
  widget = AdaptiveLayoutScreen();


  return runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
   MyApp({super.key,  required this.startWidget});

  var startWidget ;


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

    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (BuildContext context) => HomePageCubit()),


      ],
      child: MaterialApp(
        title: 'Friod Games',
        theme: ThemeData(

            primarySwatch: Colors.blue,
            fontFamily: 'StarJedi'
        ),
        // home: AnimatedSplashScreen(
        //   splash: Column(
        //     children: [
        //       SizedBox(height: 135,),
        //
        //       Text("Froid Games" , style: AppStyles.StyleBold40,),
        //       SizedBox(height: 25,),
        //       IconViewer(
        //         controller: controller,
        //         width: 140,
        //         height: 140,
        //       ),
        //     ],
        //   ),
        //   nextScreen: AdaptiveLayoutScreen(),
        //   splashTransition: SplashTransition.fadeTransition,
        //   backgroundColor:  Color(0xff53489A),//53489A //6D5ED2
        //   splashIconSize: 500,
        //   duration: 5000,
        // ),
        home: ListAge(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


