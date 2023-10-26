

import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  String mText;
  double? mSize;
  FontWeight? mWeight;
  Color? mColor;
  String? mFamily;




   CustomText({
    required this.mText,
     this.mSize,
     this.mWeight,
     this.mColor,
     this.mFamily = "Roboto",
});

  @override
  Widget build(BuildContext context) {
    return Text(
      mText,
      style: TextStyle(

        fontSize: mSize,
        fontWeight: mWeight,
        color: mColor,
        fontFamily: mFamily,

      ),

    );
  }
}
