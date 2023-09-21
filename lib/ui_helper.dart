import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors{

  static final Color backgroundColor = Color(0xffd8eaee);
  static final Color blackColor = Color(0xff26272b);
  static final Color hintColor = Color(0xffc2c6ca);
  static final Color greyColor = Color(0xff9ba1a9);
  static final Color buttonColor = Color(0xff3e64f4);
  static final Color transparentColor = Color(0xffc0bab5);





}



Widget hSpacer({mHeight = 11.0}){
  return SizedBox(
    height: mHeight,
  );

}


Widget wSpacer({mWeight = 11.0}){
  return SizedBox(
    width: mWeight,
  );

}