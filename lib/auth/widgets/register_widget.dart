import 'package:tutor/Utilities/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(){
  return AppBar(
    automaticallyImplyLeading: false,
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground, height: 1.0,
        )),
    title: Center(
      child: Text('Sign Up',
        style: TextStyle(
            color: AppColors.primaryText, fontWeight: FontWeight.normal,
            fontSize: 16.sp
        ),
      ),
    ),
  );
}

Widget reUsableText(String text){
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(text,
      style: TextStyle(color: Colors.grey.withOpacity(0.9),
          fontSize: 14.sp, fontWeight: FontWeight.normal
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func
    ){
  return Container(
    width: 320.w, height: 50.h, margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.primaryFourElementText)
    ),
    child: Row(
      children: [
        Container(
            width: 16.w, height: 16.h, margin: EdgeInsets.only(left: 17.w),
            child: Image.asset('assets/icons/$iconName.png')),
        SizedBox(
          width: 270.w, height: 50.h,
          child: TextField(
            onChanged: (value)=>func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
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
            obscureText: textType=='password'?true:false,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword(){
  return Container(
    width: 260.w, height: 44.h, margin: EdgeInsets.only(left: 25.w),
    child: GestureDetector(
      onTap: (){},
      child: Text('Forgot Password',
        style: TextStyle(color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText,
            fontSize: 12.sp
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegButton(String buttonName, String buttonType, void Function()? func){
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w, height: 50.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: buttonType=='login'?40.h:20.h),
      decoration: BoxDecoration(
          color: buttonType=='login'?AppColors.primaryElement:AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
              color: buttonType=='login'?Colors.transparent:AppColors.primaryFourElementText
          ),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1, blurRadius: 2, offset: Offset(0,1), color: Colors.grey.withOpacity(0.1)
            ),
          ]
      ),
      child: Center(child: Text(buttonName, style: TextStyle(
          color: buttonType=='login'?AppColors.primaryBackground:AppColors.primaryText,
          fontSize: 16.sp, fontWeight: FontWeight.normal),),),
    ),
  );
}