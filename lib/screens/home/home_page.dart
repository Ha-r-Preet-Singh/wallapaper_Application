// import 'package:flutter/material.dart';
// import 'package:wallpaper_app/constants/constants.dart';
// import 'package:wallpaper_app/customs/custom_text.dart';
// import 'package:wallpaper_app/customs/custom_textfield.dart';
// import 'package:wallpaper_app/screens/wallpapers%20page/wallpaper_page.dart';
// import 'package:wallpaper_app/screens/wallpapers_list/wallpapers.dart';
// import 'package:wallpaper_app/ui_helper.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   var orientation;
//
//   var searchContoller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context);
//
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: OrientationBuilder(builder: (context, orientation) {
//         if (orientation == Orientation.portrait) {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(top: 80, left: 25, right: 25),
//                   child: CustomTextField(
//                     onSubmitted: (value){
//                       print("Lion");
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => Wallpapers(query: value.toString()),));
//                     },
//                     TextEditContoller: searchContoller,
//                     hintTxt: "Search Wallpapers",
//                     suffIcon:Icons.search,
//                     validate: (p0) {},
//                   ),
//                 ),
//                 hSpacer(mHeight: media.size.height * .02),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15.0),
//                           child: CustomText(
//                             mText: "Best of the month",
//                             mFamily: "Robotobold",
//                             mColor: AppColors.blackColor,
//                             mSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                     hSpacer(),
//                     SizedBox(
//                         height: media.size.height*.3,
//
//                         child: BestOfTheMonth()),
//                   ],
//                 ),
//                 hSpacer(mHeight: media.size.height * .02),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15.0),
//                           child: CustomText(
//                             mText: "The color tone",
//                             mFamily: "Robotobold",
//                             mColor: AppColors.blackColor,
//                             mSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                     hSpacer(),
//                     SizedBox(
//                         height: media.size.height * .04,
//                         child: TheColorTone()),
//                   ],
//                 ),
//                 hSpacer(mHeight: media.size.height * .02),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15.0),
//                           child: CustomText(
//                             mText: "Categories",
//                             mFamily: "Robotobold",
//                             mColor: AppColors.blackColor,
//                             mSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: media.size.height, child: Categories()),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(top: 45, left: 25, right: 25),
//                   child: CustomTextField(
//                     onSubmitted: (value){},
//                     hintTxt: "Find Wallpaper",
//                     validate: (p0) {},
//                   ),
//                 ),
//                 hSpacer(mHeight: media.size.height * .05),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15.0),
//                           child: CustomText(
//                             mText: "Best of the month",
//                             mFamily: "Robotobold",
//                             mColor: AppColors.blackColor,
//                             mSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                     hSpacer(),
//                     SizedBox(
//                         height: media.size.height * .5,
//
//                         child: BestOfTheMonth()),
//                   ],
//                 ),
//                 hSpacer(mHeight: media.size.height * .07),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15.0),
//                           child: CustomText(
//                             mText: "The color tone",
//                             mFamily: "Robotobold",
//                             mColor: AppColors.blackColor,
//                             mSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                     hSpacer(),
//                     SizedBox(
//                         height: media.size.height * .1,
//                         child: TheColorTone()),
//                   ],
//                 ),
//                 hSpacer(mHeight: media.size.height * .05),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15.0),
//                           child: CustomText(
//                             mText: "Categories",
//                             mFamily: "Robotobold",
//                             mColor: AppColors.blackColor,
//                             mSize: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                     // hSpacer(mHeight: media.size.height * .05),
//                     SizedBox(height: media.size.height*9, child: Categories()),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
//
//   Widget BestOfTheMonth() {
//     var data = Constants.results;
//     var media = MediaQuery.of(context);
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.only(left: 10.0),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Wallpapers(query: data[index]["name"]),
//                   ));
//             },
//             child: Container(
//               width: media.size.width*.5,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     data[index]["img"],
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget TheColorTone() {
//     var media = MediaQuery.of(context);
//     var data = ConstantColor.colorTone;
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Container(
//             width: media.orientation == Orientation.portrait
//                 ? media.size.width * .1
//                 : media.size.width * 0.05,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: data[index],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget Categories() {
//     var data = Constants.results;
//     var media = MediaQuery.of(context);
//
//     return GridView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: data.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           childAspectRatio:1.8,
//           // crossAxisSpacing: 5,
//           // mainAxisSpacing: 5,
//
//           crossAxisCount: 2),
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Wallpapers(query: data[index]["name"]),
//                 ));
//           },
//           child: Container(
//             margin: EdgeInsets.only(left: 5,right: 5,top: 10),
//
//             // width: media.size.width*.5,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: NetworkImage(
//                   data[index]["img"],
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 data[index]["name"],
//                 style: TextStyle(color: Colors.white,fontSize: media.orientation == Orientation.portrait ? 22 : 40,fontFamily: "Robotobold"),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
