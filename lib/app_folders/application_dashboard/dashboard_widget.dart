import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor/app_folders/home/home_page.dart';
import 'package:tutor/app_folders/profile/profile_screen.dart';
import '../../Utilities/values/colors.dart';

Widget buildPage(int index){
  List<Widget> widget = [
    const HomePage(),
    Center(child: Text('Search'),),
    Center(child: Text('Course'),),
    Center(child: Text('Chat'),),
    const ProfilePage()
  ];

  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
      activeIcon: SizedBox(
        width: 16.w, height: 16.h,
        child: Image.asset('assets/icons/home.png',
          color: AppColors.primaryElement,
        ),
      ),
      label: 'Home',
      icon: SizedBox(
        width: 16.w, height: 16.h,
        child: Image.asset('assets/icons/home.png'),
      )),
  BottomNavigationBarItem(
      activeIcon: SizedBox(
        width: 16.w, height: 16.h,
        child: Image.asset('assets/icons/search2.png',
          color: AppColors.primaryElement,
        ),
      ),
      label: 'Search',
      icon: SizedBox(
        width: 16.w, height: 16.h,
        child: Image.asset('assets/icons/search2.png'),
      )),
  BottomNavigationBarItem(
      activeIcon: SizedBox(
        width: 16.w, height: 16.h,
        child: Image.asset('assets/icons/play-circle1.png',
          color: AppColors.primaryElement,
        ),
      ),
      label: 'Play',
      icon: SizedBox(
        width: 16.w, height: 16.h,
        child: Image.asset('assets/icons/play-circle1.png'),
      )),
  BottomNavigationBarItem(
      activeIcon: SizedBox(
        width: 16.w, height: 16.h,
        child: Image.asset('assets/icons/message-circle.png',
          color: AppColors.primaryElement,
        ),
      ),
      label: 'Chat',
      icon: SizedBox(
        width: 16.w, height: 16.h,
        child: Image.asset('assets/icons/message-circle.png'),
      )),
  BottomNavigationBarItem(
      activeIcon: SizedBox(
        width: 16.w, height: 16.h,
        child: Image.asset('assets/icons/person2.png',
          color: AppColors.primaryElement,
        ),
      ),
      label: 'Profile',
      icon: SizedBox(
        width: 16.w, height: 16.h,
        child: Image.asset('assets/icons/person2.png'),
      )),
];