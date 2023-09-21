



import 'package:flutter/material.dart';
import 'package:wallpaper_app/ui_helper.dart';


class CustomTextField extends StatelessWidget {

  String hintTxt;
  IconData? suffIcon;
  TextEditingController? TextEditContoller;
  String? Function(String?) validate;


  CustomTextField({
    required this.hintTxt,
    this.suffIcon,
    required this.validate,
    this.TextEditContoller,


  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditContoller,
      decoration: InputDecoration(

        filled: true,
        fillColor: Colors.white,
        hintText: hintTxt,


        suffixIcon:Icon(suffIcon),
        suffixIconColor:AppColors.hintColor ,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color:Colors.white ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color:Colors.white ),
        ),

      ),
      validator: validate,
    );
  }
}

