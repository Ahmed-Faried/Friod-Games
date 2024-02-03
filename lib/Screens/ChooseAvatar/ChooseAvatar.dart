import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game1/Game1(2024)/AdaptiveLayoutScreen.dart';
import 'package:game1/Screens/BottomBar/HomePageScreen/HomePageScreen.dart';
import 'package:lordicon/lordicon.dart';
import '../../Network/local/shared_preferences.dart';
import '../../generated/assets.dart';
import '../../utils/app_styles.dart';

class ChooseAvatar extends StatefulWidget {
  const ChooseAvatar({super.key});

  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  int selectedContainerIndex = 9;

  List<String> AvatarValues = [
    Assets.imagesSoonCircle,
    Assets.imagesAvatarMan2,
    Assets.imagesAvatarMan2,
    Assets.imagesSoonCircle,
    Assets.imagesSoonCircle,
    Assets.imagesSoonCircle,
    Assets.imagesSoonCircle,
    Assets.imagesSoonCircle,
    Assets.imagesSoonCircle,
  ];

  int indexs = -1;
  Color enableColor = Colors.red;
  Color disableColor = Colors.transparent;

  void changeAvatar(index) {
    selectedContainerIndex = index;
    setState(() {});
  }

  void changeIndexAvatar(int x) {
    indexs = x;
    setState(() {});
  }

  void printsss() {
    print(AvatarValues[selectedContainerIndex]);
  }

  void printsIndex() {
    print(AvatarValues[indexs]);
  }

  int ccont = 0;
  bool chooseAvatar = false;

  @override
  Widget build(BuildContext context) {
    var controller = IconController.assets(Assets.iconsLoding2);
    int cont = 0;

    controller.addStatusListener((status) {
      if (status == ControllerStatus.completed && cont < 2) {
        if (cont == 1) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageScreen())) ;

        }
        cont++;

        controller.playFromBeginning();
      }
      if (status == ControllerStatus.ready) {
        controller.play();
      }
    });
    return Scaffold(
      backgroundColor: Color(0xFF6D5ED2),
      body: Stack(
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
                      height: 188,
                      decoration: ShapeDecoration(
                        color: Color(0xFF53489A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text("Hi Ahmed", style: AppStyles.StyleMidium32),
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
              SliverPadding(
                padding: EdgeInsets.all(8.0),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 9,
                  itemBuilder: (BuildContext, int) {
                    return GestureDetector(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.transparent,
                        ),
                        child: SvgPicture.asset(Assets.imagesAvatarMan2),
                      ),
                      onTap: () {
                        if (int == 0) {
                          chooseAvatar = !chooseAvatar;
                          setState(() {});
                        }
                      },
                    );
                  },
                ),
              ),
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
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
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
                              color: Color(0x3F000000),
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: IconButton(
                          color: chooseAvatar
                              ? Color(0xFF6D5ED2)
                              : Color(0xFFCCCCCC),
                          onPressed: () {
                            if (chooseAvatar == true) {
                              CacheHelper.saveData(
                                  key: 'chooseAvatar', value: int);

                              setState(() {
                                ccont++;
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
          ccont >= 1
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
    );
  }
}
