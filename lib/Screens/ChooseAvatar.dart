import 'package:flutter/material.dart';
import 'package:game1/Game1(2024)/home.dart';
import 'package:lordicon/lordicon.dart';
import '../generated/assets.dart';
import '../utils/app_styles.dart';

class ChooseAvatar extends StatefulWidget {
  const ChooseAvatar({super.key});

  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {

  int ccont = 0;

  @override
  Widget build(BuildContext context) {
    var controller = IconController.assets(Assets.iconsLoding2);
    int cont = 0;

    controller.addStatusListener((status) {
      if (status == ControllerStatus.completed && cont < 2) {

        if (cont == 1){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
        }
        cont++;

        controller.playFromBeginning();

      }
      if (status == ControllerStatus.ready) {
        controller.play();
      }
    });
    return Scaffold(
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
                          Text("Welcome to Game",
                              style: AppStyles.StyleMidium32),
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: 9,
                        itemBuilder: (BuildContext, int) {
                          return Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
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
                                color: Color(0xFF6D5ED2),
                                onPressed: () {
                            setState(() {
                              ccont++ ;

                            });

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
              ccont >= 1 ?

              Container(
                     color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: IconViewer(
                          controller: controller,
                          width: 140,
                          height: 140,
                        ),
                      ),
                    )
              :
              SizedBox()
        ],
      ),
    );
  }
}
