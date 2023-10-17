import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:wallpaper_app/customs/custom_container.dart';
import 'package:wallpaper_app/customs/custom_text.dart';
import 'package:wallpaper_app/screens/home/home_screen.dart';
import 'package:wallpaper_app/screens/wallpapers_list/wallpapers.dart';
import 'package:wallpaper_app/ui_helper.dart';

class WallpapersPage extends StatelessWidget {
  String query;
  WallpapersPage({required this.query});

  double? mWidth;
  double? mHeight;

  var orientation;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(query),
                  fit: BoxFit.cover,
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
                          padding: const EdgeInsets.only(top: 80, right: 330),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: media.size.height * .05,
                              width: media.size.width * .11,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.transparentColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_circle_left_outlined,
                                  color: Colors.white,
                                  size: 32,
                                ),
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
                                  height: media.size.height * .07,
                                  width: media.size.width * .15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.transparentColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.info_outline_rounded,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ),
                                hSpacer(),
                                CustomText(
                                  mText: "Info",
                                  mSize: 15,
                                  mColor: Colors.white,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    downloadWallpaper();
                                  },
                                  child: Container(
                                    height: media.size.height * .07,
                                    width: media.size.width * .15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.transparentColor,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.file_download_outlined,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                                hSpacer(),
                                CustomText(
                                  mText: "Save",
                                  mSize: 15,
                                  mColor: Colors.white,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setWallpaper();
                                  },
                                  child: Container(
                                    height: media.size.height * .07,
                                    width: media.size.width * .15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.buttonColor,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                                hSpacer(),
                                CustomText(
                                  mText: "Apply",
                                  mSize: 15,
                                  mColor: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(query),
                  fit: BoxFit.cover,
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
                          padding: const EdgeInsets.only(top: 30, right: 800),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: media.size.height * .13,
                              width: media.size.width * .06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.transparentColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_circle_left_outlined,
                                  color: Colors.white,
                                  size: 32,
                                ),
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
                                  height: media.size.height * .15,
                                  width: media.size.width * .07,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.transparentColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.info_outline_rounded,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ),
                                hSpacer(),
                                CustomText(
                                  mText: "Info",
                                  mSize: 15,
                                  mColor: Colors.white,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: media.size.height * .15,
                                  width: media.size.width * .07,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.transparentColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.file_download_outlined,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ),
                                hSpacer(),
                                CustomText(
                                  mText: "Save",
                                  mSize: 15,
                                  mColor: Colors.white,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: media.size.height * .15,
                                  width: media.size.width * .07,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.buttonColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ),
                                hSpacer(),
                                CustomText(
                                  mText: "Apply",
                                  mSize: 15,
                                  mColor: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void downloadWallpaper() {
    GallerySaver.saveImage(query).then((value) {
      print(value);
    });
  }

  void setWallpaper() {
    var streamProgress = Wallpaper.imageDownloadProgress(query);

    streamProgress.listen((event) {
      print(event);
    }, onDone: () async {
      //wallpaper set

      var check = await Wallpaper.homeScreen(
          width: mWidth!,
          height: mHeight!,
          options: RequestSizeOptions.RESIZE_EXACT);
      print(check);
    }, onError: (e) {
      print("Error $e");
    });
  }
}
