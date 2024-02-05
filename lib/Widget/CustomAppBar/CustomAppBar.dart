import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.Titile, required this.Pop
  });
  final String  Titile;
  final bool  Pop ;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        Titile,
        style: AppStyles.StyleRegular20,
      ),
      centerTitle: true,
      leading: Pop != false ? IconButton(
    icon: const Icon(Icons.arrow_back),
    tooltip: 'Back',
    onPressed: () {
    Navigator.pop(context);
    },):
          SizedBox(),
      backgroundColor: Color(0xff6D5ED2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
