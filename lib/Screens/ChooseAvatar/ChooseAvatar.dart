import 'package:flutter/material.dart';
import 'package:game1/Screens/BottomBar/HomePageScreen/HomePageScreen.dart';
import 'package:lordicon/lordicon.dart';
import '../../Components/const.dart';
import '../../Network/local/shared_preferences.dart';
import '../../Widget/CustomSliverGridChooseAvatar/CustomSliverGridChooseAvatar.dart';
import '../../generated/assets.dart';
import '../../utils/app_styles.dart';

class ChooseAvatar extends StatefulWidget {
  const ChooseAvatar({super.key});

  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {



  @override
  Widget build(BuildContext context) {
    var controller = IconController.assets(Assets.iconsLoding2 );



    controller.addStatusListener((status) {
      if (status == ControllerStatus.ready) {
        controller.play();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePageScreen()),
              (Route<dynamic> route) => false,
        );

      }
      // if (status == ControllerStatus.completed && cont < 2) {
      //   if (cont == 1) {
      //
      //     controller.pause();
      //     cont = 0 ;
      //     Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => HomePageScreen()),
      //           (Route<dynamic> route) => false,
      //     );
      //   }
      //   cont++;
      //   controller.playFromBeginning();
      // }


    });


    return Scaffold(
      // backgroundColor: Color(0xff6D5ED2).withOpacity(0.75),
      backgroundColor: Colors.white ,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: ShapeDecoration(
                          color: Color(0xFF53489A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Text("Hi ${NameV.toString()}", style: AppStyles.StyleMidium32),
                          Text("Choose your Avatar",
                              style: AppStyles.StyleMidium22),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 15,
                )),
                CustomChooseSliverGridAvatar(),
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 35,
                )),
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 238,
                          height: 61.35,
                          decoration: ShapeDecoration(
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Color(0xFF6D5ED2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "Next",
                            style: AppStyles.StyleBold22,
                          )),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF4F3F6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: IconButton(
                            color: chooseAvatar
                                ? Color(0xFF6D5ED2)
                                : Color(0xFFCCCCCC),
                            onPressed: () {
                              if (chooseAvatar == true) {
                                CacheHelper.saveData(
                                    key: 'chooseAvatar', value: AvatarValues[indexs]);
                                print(AvatarValues[indexs]);

                                setState(() {
                                  cont = 1;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.arrow_forward_outlined,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            cont == 1
                ? Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: IconViewer(
                        controller: controller,
                        width: 140,
                        height: 140,
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
