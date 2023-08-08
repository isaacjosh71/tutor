import 'package:tutor/Utilities/values/constants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utilities/services/global.dart';
import '../../Utilities/values/colors.dart';
import '../../app_folders/onboarding/bloc/onboarding_blocs.dart';
import '../../app_folders/onboarding/bloc/onboarding_states.dart';
import '../../app_folders/onboarding/bloc/onboarding_events.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<OnBoardingBlocs, OnBoardingState>(builder:
      (context, state){
        return Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index){
                  state.page = index;
                  BlocProvider.of<OnBoardingBlocs>(context).add(OnBoardingEvents());
                },
                children: [
                  _page(
                      1,
                      context,
                      'Online Learning',
                      'Forget about a form of paper, get all tutorials on an app',
                      'assets/images/reading.png',
                    'Next',
                  ),
                  _page(
                      2,
                      context,
                      'Connect with everyone',
                      'Always keep in touch with your tutors and friends',
                      'assets/images/boy.png',
                    'Next'
                  ),
                  _page(
                      3,
                      context,
                      'Fascinated Learning',
                      'Anywhere, Anytime, the time is at our discretion to study whenever you want',
                    'assets/images/man.png',
                      'Get Started',
                  )
                ],
              ),
              Positioned(bottom: 100.h,child: DotsIndicator(dotsCount: 3,
                position: state.page,
                decorator: DotsDecorator(
                    color:AppColors.primaryThreeElementText, activeColor: AppColors.primaryElement,
                    size: const Size.square(8.0), activeSize: const Size(18.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                mainAxisAlignment: MainAxisAlignment.center,),
              )
            ],
          ),
        );
      }
      ),
    );
  }

  Widget _page(int index, BuildContext context, String title, String text,
      String imgPath, String buttonName){
    return Column(
      children: [
        SizedBox(
          width: 340.w, height: 340.h,
          child: Image.asset(imgPath, fit: BoxFit.cover,),
        ),
        SizedBox(height: 10.h,),
        SizedBox(child: Text(title,
          style: TextStyle(fontSize: 24.sp, color: AppColors.primaryText, fontWeight: FontWeight.normal),
        ),),
        SizedBox(height: 15.h,),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: AppColors.primarySecondaryElementText,
                fontWeight: FontWeight.normal),
          ),),
        SizedBox(height: 5.h,),
        GestureDetector(
          onTap: (){
            if(index<3){
              pageController.animateToPage(index, duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOutQuint);
            } else{
              Global.storageServices.setBool(AppConsts.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context).pushNamedAndRemoveUntil('/signIn', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 45.h),
            width: 325.w, height: 40.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1, blurRadius: 2,
                      offset: const Offset(0, 1)
                  )
                ]
            ),
            child: Center(
              child: Text(buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp, fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
