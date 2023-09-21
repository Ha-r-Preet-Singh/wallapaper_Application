


import 'package:flutter/material.dart';
import 'package:wallpaper_app/customs/custom_container.dart';
import 'package:wallpaper_app/customs/custom_text.dart';
import 'package:wallpaper_app/ui_helper.dart';

class WallpapersPage extends StatefulWidget {
  const WallpapersPage({super.key});

  @override
  State<WallpapersPage> createState() => _WallpapersPageState();
}

class _WallpapersPageState extends State<WallpapersPage> {
  var orientation;
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return OrientationBuilder(builder: (context, orientation) {
      if(orientation== Orientation.portrait){
        return Form(
          key: portraitKey,
            child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://images.pexels.com/photos/18056655/pexels-photo-18056655/free-photo-of-a-humpback-whale-emerging-from-the-water.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load"),fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80,right: 300),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: media.size.height*.06,
                          width: media.size.width*.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.transparentColor,
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_circle_left_outlined,color: Colors.white,size: 32,),
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: media.size.height*.07,
                              width: media.size.width*.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.transparentColor,
                              ),
                              child: Center(
                                child: Icon(Icons.info_outline_rounded,color: Colors.white,size: 32,),
                              ),
                            ),
                            hSpacer(),
                            CustomText(mText: "Info",mSize: 15,mColor: Colors.white,),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: media.size.height*.07,
                              width: media.size.width*.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.transparentColor,
                              ),
                              child: Center(
                                child: Icon(Icons.file_download_outlined,color: Colors.white,size: 32,),
                              ),
                            ),
                            hSpacer(),
                            CustomText(mText: "Save",mSize: 15,mColor: Colors.white,),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height:  media.size.height*.07,
                              width:media.size.width*.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.buttonColor,
                              ),
                              child:  Center(
                                child: Icon(Icons.edit,color: Colors.white,size: 32,),
                              ),
                            ),
                            hSpacer(),
                            CustomText(mText: "Apply",mSize: 15,mColor: Colors.white,),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));

      }else{
        return Form(
          key: landscapeKey,
            child:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://images.pexels.com/photos/18056655/pexels-photo-18056655/free-photo-of-a-humpback-whale-emerging-from-the-water.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load"),fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30,right: 800),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: media.size.height*.13,
                          width: media.size.width*.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.transparentColor,
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_circle_left_outlined,color: Colors.white,size: 32,),
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: media.size.height*.15,
                              width: media.size.width*.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.transparentColor,
                              ),
                              child: Center(
                                child: Icon(Icons.info_outline_rounded,color: Colors.white,size: 32,),
                              ),
                            ),
                            hSpacer(),
                            CustomText(mText: "Info",mSize: 15,mColor: Colors.white,),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height:  media.size.height*.15,
                              width: media.size.width*.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.transparentColor,
                              ),
                              child: Center(
                                child: Icon(Icons.file_download_outlined,color: Colors.white,size: 32,),
                              ),
                            ),
                            hSpacer(),
                            CustomText(mText: "Save",mSize: 15,mColor: Colors.white,),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height:  media.size.height*.15,
                              width: media.size.width*.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.buttonColor,
                              ),
                              child:  Center(
                                child: Icon(Icons.edit,color: Colors.white,size: 32,),
                              ),
                            ),
                            hSpacer(),
                            CustomText(mText: "Apply",mSize: 15,mColor: Colors.white,),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
      }

    },);
  }
}
