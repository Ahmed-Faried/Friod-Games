import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game1/Screens/ChooseAvatar/ChooseAvatar.dart';
import 'package:game1/Test%20Screens%20ChatGPT/List%20Age.dart';
import 'package:game1/utils/app_styles.dart';
import '../../Components/const.dart';
import '../../Network/local/shared_preferences.dart';
import '../../generated/assets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var NameController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal:  8.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: ShapeDecoration(
                        color: Color(0xFF53489A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Text("Welcome to Game", style: AppStyles.StyleMidium32),
                  ],
                ),
                SizedBox(height: 30),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 238,
                      height: 250,
                      decoration: ShapeDecoration(
                        color: Color(0xFF6D5ED2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Image.asset(
                      Assets.iconsSmallCuteMonster,
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                SizedBox(height: 45),
                Container(
                  width: 329,
                  height: 70,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Color(0x4C9D9BAD)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: NameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          // toastShow(
                          //     msg: 'Name isEmpty', state: toastStates.WARNING);
                          return "* This field is required ";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(Assets.imagesIconUesrBlue,
                              height: 35, width: 35, fit: BoxFit.fill),
                        ),
                        label: Text(
                          "Enter Your Name",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListAge(),
                      Spacer(),
                      InkWell(
                        child: Container(
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
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            color: Color(0xFF6D5ED2),
                          ),
                        ),
                        onTap: () {
                          if (formKey.currentState!.validate() &&
                              selectedAge != 'Select Age') {
                            CacheHelper.saveData(
                                key: 'Name', value: NameController.text);
                            print(CacheHelper.getData(key: 'Name'));
                            CacheHelper.saveData(key: 'Age', value: selectedAge);
                            print(CacheHelper.getData(key: 'Age'));

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChooseAvatar()));
                          } else {
                            print("Age Is Null Or NAME IS Null");
                          }
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Container(
                    width: 250,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            Assets.imagesFacebook,
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                          SvgPicture.asset(
                            Assets.imagesWhatsApp,
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                          SvgPicture.asset(
                            Assets.imagesGoogle,
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                          SvgPicture.asset(
                            Assets.imagesDiscord,
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
