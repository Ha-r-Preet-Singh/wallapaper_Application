import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper_app/bloc%202/trending_bloc.dart';
import 'package:wallpaper_app/constants/constants.dart';
import 'package:wallpaper_app/customs/custom_text.dart';

import 'package:wallpaper_app/screens/wallpapers%20page/wallpaper_page.dart';

import 'package:wallpaper_app/screens/wallpapers_list/wallpapers.dart';
import 'package:wallpaper_app/ui_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TrendingBloc>().add(GetTrendingWallpaper());
  }

  var orientation;

  var searchContoller = TextEditingController();

  var isLandScape = false;

  @override
  Widget build(BuildContext context) {
    bool isSelectedColor = false;
    var media = MediaQuery.of(context);
    var color = ConstantColor.colorTone;
    var data = Constants.results;
    isLandScape = media.orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
              child: TextField(
                onSubmitted: (value) {
                  print("Lion");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Wallpapers(query: value.toString()),
                      ));
                },
                controller: searchContoller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: "Search Wallpaper",
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Wallpapers(query: searchContoller.text),
                            ));
                      },
                      child: Icon(Icons.search)),
                ),
              ),
            ),
            hSpacer(mHeight: media.size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: CustomText(
                    mText: "Best of the month",
                    mFamily: "Robotobold",
                    mColor: AppColors.blackColor,
                    mSize: 18,
                  ),
                ),
              ],
            ),
            hSpacer(),
            SizedBox(
              height:
                  isLandScape ? media.size.height * .6 : media.size.height * .3,
              child: BlocBuilder<TrendingBloc, TrendingState>(
                builder: (_, state) {
                  if (state is TrendingLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TrendingErrorState) {
                    return Column(
                      children: [
                        Center(
                          child: Text(state.errorMsg),
                        ),
                        Lottie.asset("assets/lottie/error.json",fit: BoxFit.cover,height: 250),

                      ],
                    );
                  } else if (state is TrendingLoadedState) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.myData.photos!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WallpapersPage(
                                          query: state.myData.photos![index]
                                              .src!.portrait!),
                                    ));
                              },
                              child: Container(
                                width: media.size.width * .5,
                                // height: media.size.height*.3,
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(state.myData
                                            .photos![index].src!.portrait!
                                        // state.myData.photos![index].src!.portrait!,
                                        ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            hSpacer(mHeight: media.size.height * .02),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: CustomText(
                        mText: "The color tone",
                        mFamily: "Robotobold",
                        mColor: AppColors.blackColor,
                        mSize: 18,
                      ),
                    ),
                  ],
                ),
                hSpacer(),
                SizedBox(
                    height: isLandScape
                        ? media.size.height * .09
                        : media.size.height * .04,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: color.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                            onTap: () {
                              isSelectedColor = true;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wallpapers(
                                      query:
                                          searchContoller.text.toString() != ""
                                              ? searchContoller.text.toString()
                                              : "girl",
                                      colorCode: color[index]["name"],
                                    ),
                                  ));
                            },
                            child: Container(
                              width: isLandScape
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
              ],
            ),
            hSpacer(mHeight: media.size.height * .02),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: CustomText(
                        mText: "Categories",
                        mFamily: "Robotobold",
                        mColor: AppColors.blackColor,
                        mSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: isLandScape ? media.size.height : media.size.height,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.8,
                              // crossAxisSpacing: 5,
                              // mainAxisSpacing: 5,

                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Wallpapers(query: data[index]["name"]),
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 5, right: 5, top: 10),

                            // width: media.size.width*.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  data[index]["img"],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                data[index]["name"],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: media.orientation ==
                                            Orientation.portrait
                                        ? 22
                                        : 40,
                                    fontFamily: "Robotobold"),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
