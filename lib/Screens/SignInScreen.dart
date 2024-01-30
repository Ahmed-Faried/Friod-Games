import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game1/Screens/ChooseAvatar.dart';
import 'package:game1/utils/app_styles.dart';
import 'package:lordicon/lordicon.dart';

import '../generated/assets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var NameController = TextEditingController();


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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
                Text("Welcome to Game", style: AppStyles.StyleMidium32 ),
              ],
            ),
            SizedBox(height : 38),
            Stack(
              alignment: Alignment.center,

              children: [
                Container(
                  width: 238,
                  height: 307,
                  decoration: ShapeDecoration(
                    color: Color(0xFF6D5ED2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SvgPicture.asset(Assets.imagesAvatarSonicCircle ,width:  200, height: 300, fit: BoxFit.fill,),

              ],
            ),
            SizedBox(height : 78),
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
                  keyboardType : TextInputType.text ,
                  validator: (value){
                    return null;
                  } ,
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
                      child: SvgPicture.asset(Assets.imagesIconUesrBlue , height : 35 , width : 35 , fit : BoxFit.fill ),
                    ),
                    label: Text(
                      "Enter Your Name",
                      style: TextStyle(color: Colors.grey),
                    ),

                  ),

                ),
              ),
            ),
            SizedBox(height : 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 270,
                  height: 70,
                  decoration: ShapeDecoration(
                    color: Color(0xFF6D5ED2),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Color(0x4C9D9BAD)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: NameController,
                      keyboardType : TextInputType.text ,
                      validator: (value){
                        return null;
                      } ,
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
                          child: SvgPicture.asset(Assets.imagesIconUesrWhite , height : 35 , width : 35 , fit : BoxFit.fill ),
                        ),
                        label: Text(
                          "Select Your Age",
                          style: TextStyle(color: Colors.white ),
                        ),

                      ),

                    ),
                  ),
                ),
                SizedBox(width: 12,),
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
                    child: Icon(Icons.arrow_forward_outlined , color: Color(0xFF6D5ED2),),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseAvatar()));
                  },
                )
              ],
            ),
            SizedBox(height : 58),
            Center(
              child: Container(
                width: 250,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [

                      SvgPicture.asset(Assets.imagesFacebook , width: 30, height: 30,fit: BoxFit.fill,),
                      SvgPicture.asset(Assets.imagesWhatsApp, width: 30, height: 30,fit: BoxFit.fill,),
                      SvgPicture.asset(Assets.imagesGoogle, width: 30, height: 30,fit: BoxFit.fill,),
                      SvgPicture.asset(Assets.imagesDiscord, width: 30, height: 30,fit: BoxFit.fill,),

                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
