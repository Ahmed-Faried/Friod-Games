import 'package:flutter/material.dart';
import 'package:game1/Widget/CustomAppBar/CustomAppBar.dart';
import 'package:lordicon/lordicon.dart';
import '../../../Components/const.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../../Widget/CustomSliverGridChooseAvatar/CustomSliverGridChooseAvatar.dart';
import '../../../generated/assets.dart';
import '../../../utils/app_styles.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {

    var controller = IconController.assets(Assets.iconsLoding2);


    controller.addStatusListener((status) {
      if (status == ControllerStatus.completed && cont < 2) {

        cont++;

        controller.playFromBeginning();
        if (cont == 1) {
        // toastShow(msg: "Done", state: toastStates.SUCCESS);
        }
      }
      if (status == ControllerStatus.ready) {
        controller.play();
      }
    });


    return Scaffold(
      appBar: CustomAppBar(titile: " Hi ${NameV.toString()}" ,Pop: false,),
      backgroundColor: Color(0xff6D5ED2).withOpacity(0.75),

      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            slivers: [
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
                              "Edit",
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
                                  key: 'chooseAvatar', value: AvatarValues[indexs]);
                              print(AvatarValues[indexs]);

                              setState(() {
                                cont++;
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
          cont >= 1
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
