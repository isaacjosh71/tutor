
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor/Utilities/values/colors.dart';

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

Widget slideView(){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w, height: 160.h,
        child: PageView(
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
        position: 1,
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
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
    width: 325.w, height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.r)),
      image: DecorationImage(
        fit: BoxFit.fill, image: AssetImage(path)
      )
    ),
  );
}