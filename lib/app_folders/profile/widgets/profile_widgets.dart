import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor/Utilities/routers/routes.dart';
import 'package:tutor/Utilities/values/colors.dart';
import 'package:tutor/Utilities/widget/global_text.dart';
import 'package:tutor/auth/widgets/register_widget.dart';

AppBar buildProfileAppBar(){
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w, height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          reGlobalUsableText('Profile'),
          SizedBox(
            width: 24.w, height: 24.h,
            child: Image.asset('assets/icons/more-vertical.png'),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton(){
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w, height: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: const DecorationImage(image:
        AssetImage('assets/icons/headpic.png'))
    ),
    child: Image(
      width: 25.w, height: 25.h,
      image: const AssetImage('assets/icons/edit_3.png'),
    ),
  );
}
var profileOptions=<String, String>{
  'Setting':'settings.png',
  'Payment details':'credit-card.png',
  'Achievement': 'award.png',
  'love':'heart(1).png',
  'Reminders': "cube.png"
};
Widget buildListView(BuildContext context){
  return Column(
    children: [
      ...List.generate(profileOptions.length, (index) =>
          GestureDetector(
            onTap: ()=> Navigator.of(context).pushNamed(AppRoutes.SETTINGSPAGE),
            child: Container(
              margin: EdgeInsets.only(bottom: 15.h),
                child: Row(
                  children: [
                    Container(
                      width: 40.w, height: 40.h,
                      padding: const EdgeInsets.all(7.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: AppColors.primaryElement
                      ),
                      child: Image.asset('assets/icons/${profileOptions.values.elementAt(index)}'),
                    ),
                    SizedBox(width: 15.w,),
                    Text(profileOptions.keys.elementAt(index),
                      style: TextStyle(fontSize: 16.sp, color: AppColors.primaryText,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
            ),
          )
      )
    ],
  );
}