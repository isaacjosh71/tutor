
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor/Utilities/values/colors.dart';
import 'package:tutor/app_folders/home/home_blocs/event.dart';
import 'package:tutor/app_folders/home/home_blocs/state.dart';

import '../../../Utilities/widget/global_text.dart';
import '../home_blocs/bloc.dart';

AppBar buildHomeAppBar(){
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w, height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w, height: 40.w,
              decoration: const BoxDecoration(
                image: DecorationImage(image:
                AssetImage('assets/icons/person.png'))
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text, {Color color=AppColors.primaryElement, int top=20}){
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(text,
    style: TextStyle(
      color: color,
      fontSize: 24.sp, fontWeight: FontWeight.bold
    ),
    ),
  );
}

Widget searchView(){
  return Row(
    children: [
      Container(
        width: 280.w, height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.primaryFourElementText)
        ),
        child: Row(
          children: [
            Container(
              width: 16.w, height: 16.h, margin: EdgeInsets.only(left: 17.w),
              child: Image.asset('assets/icons/search.png'),
            ),
            Container(
              width: 240.w, height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: 'search your course',
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                    ),
                    hintStyle: const TextStyle(
                        color: AppColors.primarySecondaryElementText
                    )
                ),
                style: TextStyle(
                    color: AppColors.primaryText, fontFamily: 'Avenir',
                    fontSize: 14.sp, fontWeight: FontWeight.normal
                ),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: 5.w),
          width: 35.w, height: 35.w,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.r)),
            border: Border.all(color: AppColors.primaryElement)
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}

Widget slideView(BuildContext context, HomePageStates state){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w, height: 160.h,
        child: PageView(
          onPageChanged: (value){
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _sliderContainer(path: 'assets/icons/Art.png'),
            _sliderContainer(path: 'assets/icons/Image(1).png'),
            _sliderContainer(path: 'assets/icons/Image(2).png')
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 2.h),
        child: DotsIndicator(dotsCount: 3,
        position: state.index.toInt(),
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(15.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r)
            )
          ),
        ),
      )
    ],
  );
}

Widget _sliderContainer({String path = 'assets/icons/Art.png'}){
  return Container(
    margin: EdgeInsets.only(right: 7.w),
    width: 325.w, height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.r)),
      image: DecorationImage(
        fit: BoxFit.fill, image: AssetImage(path)
      )
    ),
  );
}

Widget menuView(){
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reGlobalUsableText('Choose your course'),
            GestureDetector(
              onTap: (){},
                child: reGlobalUsableText('See all', color: AppColors.primaryThreeElementText, fontSize: 14))
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          children: [
            _reUseAbleMenuBars('All'),
            _reUseAbleMenuBars('Popular', textColor: AppColors.primaryElement,
            backGroundColor: Colors.white, borderColor: AppColors.primaryElement),
            _reUseAbleMenuBars('Newest', textColor: AppColors.primaryElement,
                backGroundColor: Colors.white, borderColor: AppColors.primaryElement),
          ],
        ),
      )
    ],
  );
}

Widget _reUseAbleMenuBars(String menuText,
    {Color textColor = AppColors.primaryElementText,
      Color backGroundColor = AppColors.primaryElement, Color borderColor = AppColors.primaryElement}){
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: borderColor.withOpacity(0.5))
    ),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    child: reGlobalUsableText(menuText, color: textColor.withOpacity(0.7),
        fontSize: 13, fontWeight: FontWeight.normal),
  );
}

Widget courseGrid(){
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/icons/Image(1).png'))
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Best course for IT and Engineering',
          maxLines: 1, overflow: TextOverflow.fade,
          textAlign: TextAlign.left, softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold, fontSize: 12.sp
          ),
        ),
        SizedBox(height: 5.h,),
        Text('Flutter best course',
          maxLines: 1, overflow: TextOverflow.fade,
          textAlign: TextAlign.left, softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal, fontSize: 10.sp
          ),
        ),
      ],
    ),
  );
}