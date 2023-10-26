import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:wallpaper_app/constants/constants.dart';
import 'package:wallpaper_app/customs/custom_text.dart';
import 'package:wallpaper_app/models/data_model.dart';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:wallpaper_app/screens/wallpapers%20page/wallpaper_page.dart';
import 'package:wallpaper_app/searchbloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/ui_helper.dart';
import 'package:http/http.dart' as http;

class Wallpapers extends StatefulWidget {
   ScrollController mController = ScrollController();

  String query;
  String? colorCode;
  Wallpapers({super.key, required this.query, this.colorCode});

  @override
  State<Wallpapers> createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {
  var orientation;
  var searchContoller = TextEditingController();

  var isLandscape = false;
  bool isSelectedColor = false;

  List<PhotosModel> arrPhotos = [];

  int? totalResult;
  int page = 1;

  // late Future<DataModel> photos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    context.read<WallpaperBloc>().add(GetSearchWallpaper(
        query: widget.query, colorCode: widget.colorCode, page: page));
    getUpdate();
  }



  void getUpdate() {
    widget.mController = ScrollController()
      ..addListener(() {
        if (widget.mController.position.pixels ==
            widget.mController.position.maxScrollExtent) {
          num totalPage;
          if (totalResult != null) {
            totalResult! % 40 == 0
                ? totalPage = totalResult! / 40
                : totalPage = (totalResult! / 40) + 1;
            if (page < totalPage) {
              page++;
              context.read<WallpaperBloc>().add(GetSearchWallpaper(
                  query: widget.query,
                  colorCode: widget.colorCode,
                  page: page));
            }
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    var color = ConstantColor.colorTone;
    var media = MediaQuery.of(context);
    isLandscape = media.orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocListener<WallpaperBloc, WallpaperState>(
        listener: (_, state) {
          if (state is WallpaperLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Loading more images'),
            ));
          } else if (state is WallpaperErrorState) {
            Column(
              children: [
                Center(
                  child: Text(state.errorMsg),
                ),
                Lottie.asset("assets/lottie/error.json",
                    fit: BoxFit.cover, height: 250),
              ],
            );
          } else if (state is WallpaperLoadedState) {
            setState(() {
              arrPhotos += state.mData.photos!;
              totalResult = state.mData.total_results;
            });
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(


              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 50),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Icon(Icons.arrow_back)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 50),
                  child: CustomText(
                    mText: widget.query,
                    mSize: 37,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomText(
                mText: "${totalResult ?? 'Loading'} wallpaper available",
                mSize: 17,
                mColor: AppColors.greyColor,
              ),
            ),
            hSpacer(),
            SizedBox(
                height: isLandscape
                    ? media.size.height * .09
                    : media.size.height * .04,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: color.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: InkWell(
                        onTap: () {
                          isSelectedColor = true;

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Wallpapers(
                                  query: widget.query,
                                  colorCode: color[index]["name"],
                                ),
                              ));
                        },
                        child: Container(
                          width: isLandscape
                              ? media.size.width * 0.05
                              : media.size.width * .1,

                          // width: media.orientation == Orientation.portrait
                          //     ? media.size.width * .1
                          //     : media.size.width * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: color[index]["color"],
                          ),
                        ),
                      ),
                    );
                  },
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  controller: widget.mController,
                  itemCount: arrPhotos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isLandscape ? 4 : 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: isLandscape ? 16 / 9 : 8 / 14),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WallpapersPage(
                                query: isLandscape
                                    ? arrPhotos[index].src!.landscape!
                                    : arrPhotos[index].src!.portrait!,
                              ),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            image: DecorationImage(
                                image: NetworkImage(isLandscape
                                    ? arrPhotos[index].src!.landscape!
                                    : arrPhotos[index].src!.portrait!),
                                fit: BoxFit.fill)),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
