import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/constants.dart';
import 'package:wallpaper_app/customs/custom_text.dart';
import 'package:wallpaper_app/customs/custom_textfield.dart';
import 'package:wallpaper_app/screens/wallpapers%20page/wallpaper_page.dart';
import 'package:wallpaper_app/screens/wallpapers_list/wallpapers.dart';
import 'package:wallpaper_app/ui_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var orientation;
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Form(
            key: portraitKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 80, left: 25, right: 25),
                    child: CustomTextField(
                      hintTxt: "Find Wallpaper",
                      validate: (p0) {},
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
                              mText: "Best of the month",
                              mFamily: "Robotobold",
                              mColor: AppColors.blackColor,
                              mSize: 18,
                            ),
                          ),
                        ],
                      ),
                      hSpacer(),
                      Container(
                          height: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WallpapersPage(),
                                  ));
                            },
                            child: BestOfTheMonth(),
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
                          height: media.size.height * .04,
                          child: TheColorTone()),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: SizedBox(height: 1000, child: Categories()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Form(
            key: landscapeKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 45, left: 25, right: 25),
                    child: CustomTextField(
                      hintTxt: "Find Wallpaper",
                      validate: (p0) {},
                    ),
                  ),
                  hSpacer(mHeight: media.size.height * .05),
                  Column(
                    children: [
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
                      Container(
                          height: media.size.height * .5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WallpapersPage(),
                                  ));
                            },
                            child: BestOfTheMonth(),
                          )),
                    ],
                  ),
                  hSpacer(mHeight: media.size.height * .07),
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
                          height: media.size.height * .1,
                          child: TheColorTone()),
                    ],
                  ),
                  hSpacer(mHeight: media.size.height * .05),
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
                      hSpacer(mHeight: media.size.height * .05),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: SizedBox(height: 1000, child: Categories()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Widget BestOfTheMonth() {
    var data = Constants.results;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              data[index]['img'],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget TheColorTone() {
    var media = MediaQuery.of(context);
    var data = ConstantColor.colorTone;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            width: media.orientation == Orientation.portrait
                ? media.size.width * .1
                : media.size.width * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: data[index],
            ),
          ),
        );
      },
    );
  }

  Widget Categories() {
    var data = Constants.results;
    var media = MediaQuery.of(context);

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Wallpapers(query: data[index]["name"]),
                ));
          },
          child: Container(
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
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
