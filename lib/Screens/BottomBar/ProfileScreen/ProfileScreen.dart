import 'package:flutter/material.dart';
import 'package:game1/Components/components.dart';
import 'package:game1/Screens/BottomBar/HomePageScreen/HomePageScreen.dart';
import 'package:game1/Widget/CustomAppBar/CustomAppBar.dart';
import 'package:lordicon/lordicon.dart';
import '../../../Components/const.dart';
import '../../../Network/local/shared_preferences.dart';
import '../../../generated/assets.dart';
import '../../../utils/app_styles.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  int selectedContainerIndex = 9;

  int indexs = -1;
  // Color enableColor = Colors.red;
  // Color disableColor = Colors.transparent;

  // void changeAvatar(index) {
  //   selectedContainerIndex = index;
  //   setState(() {});
  // }
  //
  // void changeIndexAvatar(int x) {
  //   indexs = x;
  //   setState(() {});
  // }
  int ccont = 0;
  bool chooseAvatar = false;

  @override
  Widget build(BuildContext context) {
    var NameV = CacheHelper.getData(key: "Name");

    var controller = IconController.assets(Assets.iconsLoding2);

    int cont = 0;

    controller.addStatusListener((status) {
      if (status == ControllerStatus.completed && cont < 2) {

        cont++;

        controller.playFromBeginning();
        if (cont == 1) {
        toastShow(msg: "Done", state: toastStates.SUCCESS);
        }
      }
      if (status == ControllerStatus.ready) {
        controller.play();
      }
    });
    return Scaffold(
      appBar: CustomAppBar(Titile: " Hi ${NameV.toString()}" ,Pop: true,),
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
              SliverPadding(
                padding: EdgeInsets.all(8.0),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: AvatarValues.length,
                  itemBuilder: (BuildContext, int) {
                    return GestureDetector(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border:  indexs == int ? Border.all(color: Colors.black , width: 5)
                          : Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.transparent,
                        ),
                        child: Image.asset(AvatarValues[int] ,),
                      ),
                      onTap: () {
                        if(AvatarValues[int] ==  Assets.imagesTest2){
                          chooseAvatar = false;
                          setState(() {

                          });
                          print(AvatarValues[int]);
                        }else{
                          chooseAvatar = true;
                          setState(() {
                            indexs = int ;
                            print(AvatarValues[int]);

                          });
                        }
                        // if (chooseAvatar == tr) {

                        // }
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
