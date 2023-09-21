import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app/constants/constants.dart';
import 'package:wallpaper_app/customs/custom_text.dart';
import 'package:wallpaper_app/models/data_model.dart';
import 'package:wallpaper_app/ui_helper.dart';



class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
    );
  }


}
