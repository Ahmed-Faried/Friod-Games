import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game1/generated/assets.dart';
import 'package:game1/utils/app_styles.dart';
import '../../../HomePageBloc/HomePageCubit.dart';
import '../../../HomePageBloc/HomePageStates.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.white,
    //     statusBarIconBrightness:
    //         Brightness.dark //or set color with: Color(0xFF0000FF)
    //     ));

    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // extendBodyBehindAppBar: true,
          extendBody: true,
          backgroundColor: Colors.orange,
          body: HomePageCubit.get(context)
              .BottomBarScreens[HomePageCubit.get(context).x],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(

                color: Color(0xff5c50c4),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: BottomNavigationBar(
                elevation: 0 ,
                backgroundColor: Colors.transparent,
                // fixedColor: Color(0xFF6D5ED2),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.black,
                selectedLabelStyle: AppStyles.StyleRegular20,
                unselectedLabelStyle: AppStyles.StyleRegular19,
                type: BottomNavigationBarType.fixed,
                currentIndex: HomePageCubit.get(context).x,
                onTap: (index) {
                  HomePageCubit.get(context).changedBottomBar(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        Assets.imagesIconNavigationYallow,
                        width: 45,
                        height: 45,
                        fit: BoxFit.fill,
                      ),
                      label: 'Games'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        Assets.imagesIconUesrBlue,
                        width: 45,
                        height: 45,
                        fit: BoxFit.fill,
                      ),
                      label: 'Profile'),
                ]),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: buildFloatingActionButton(),
        );
      },
    );
  }

  Widget buildFloatingActionButton() {
    return FloatingActionButton.extended(
      shape: CircleBorder(),
      onPressed: () {},
      label: Container(
        width: 75,
        height: 75,
        decoration: ShapeDecoration(
          color: Color(0xFF6D5ED2),
          shape: OvalBorder(),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(-1, 4),
              spreadRadius: 2,
            )
          ],
          // borderRadius: BorderRadius.circular(50),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,

          child: SvgPicture.asset(
            Assets.imagesHartPink,
            width: 60,
            height: 60,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      shape:  const AutomaticNotchedShape(
          RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
      notchMargin: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          buildColumn(SvgPicture.asset(Assets.imagesIconNavigationYallow) , Text("Games")),
          buildColumn(SvgPicture.asset(Assets.imagesIconUesrBlue), Text("Profile")),
        ],
      ),
    );
  }

  Widget buildColumn(Widget icon, Widget label) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [icon, label],
      ),
    );
  }
}
