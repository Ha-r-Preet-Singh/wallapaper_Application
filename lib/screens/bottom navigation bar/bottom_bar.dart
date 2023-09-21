

import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/acoount/account_page.dart';
import 'package:wallpaper_app/screens/home/home_page.dart';
import 'package:wallpaper_app/screens/save/save_page.dart';
import 'package:wallpaper_app/ui_helper.dart';

class BottomBar extends StatefulWidget {




  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  static const List<Widget> pages = [
   HomePage(),
    SavePage(),
    AccountPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,

        selectedItemColor: AppColors.buttonColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_sharp),label:"" ),
          BottomNavigationBarItem(icon: Icon(Icons.file_download_outlined),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity),label: ""),

        ],


        currentIndex: selectedIndex,
        onTap: onitemTapped,
        
      ),
    );


  }
  void onitemTapped(int index){
    setState(() {
      selectedIndex = index;
    });

  }
}
