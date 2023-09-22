import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/customs/custom_text.dart';
import 'package:wallpaper_app/models/data_model.dart';
import 'package:wallpaper_app/ui_helper.dart';
import 'package:http/http.dart' as http;

class Wallpapers extends StatefulWidget {
  String query;
  Wallpapers({required this.query});

  @override
  State<Wallpapers> createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {
  var orientation;
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();

  // late Future<DataModel> photos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WallpaperBloc>().add(GetTrendingWallpaper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Form(
                key: portraitKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      child: CustomText(
                        mText: widget.query,
                        mSize: 67,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: CustomText(
                        mText: "36 wallpaper available",
                        mSize: 17,
                        mColor: AppColors.greyColor,
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<WallpaperBloc,WallpaperState>(

                        builder: (context, state) {
                          if(state is WallpaperLoadingState){
                            return Center(child: CircularProgressIndicator(),);
                          }else if(state is WallpaperErrorState){


                          }else if(state is WallpaperLoadedState){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                itemCount: state.mData.photos!.length,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 9 / 14),
                                itemBuilder: (_, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(21),
                                        image: DecorationImage(
                                            image: NetworkImage(state.mData.photos![index]
                                                .src!
                                                .portrait!),
                                            fit: BoxFit.fill)),
                                  );
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      )


                    ),
                  ],
                ));
          } else {
            return Form(
                key: landscapeKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      child: CustomText(
                        mText: "Nature",
                        mSize: 67,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: CustomText(
                        mText: "36 wallpaper available",
                        mSize: 17,
                        mColor: AppColors.greyColor,
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<WallpaperBloc,WallpaperState>(
                        builder: (context, state) {
                          if(state is WallpaperLoadingState){
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }else if(state is WallpaperErrorState){

                          }else if(state is WallpaperLoadedState){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                itemCount: state.mData.photos!.length,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 9 / 14),
                                itemBuilder: (_, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(21),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                state.mData.photos![index]
                                                .src!
                                                .portrait!),
                                            fit: BoxFit.fill)),
                                  );
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                ));
          }
        },
      ),
    );
  }

  // Future<DataModel> getWallpapers(String query) async {
  //   Uri mUrl =
  //       Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=20");
  //
  //   var res = await http.get(mUrl, headers: {
  //     "Authorization":
  //         "ccEI7ea5vTWvcypWjTBtmnSVnyGSW9pUpX910XJEbYsJI0We4U08zfRt"
  //   });
  //   print("SC: ${res.statusCode},RES: ${res.body}");
  //   if (res.statusCode == 200) {
  //     var mData = jsonDecode(res.body);
  //     return DataModel.fromJson(mData);
  //   } else {
  //     return DataModel();
  //   }
  // }
}
