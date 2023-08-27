
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../values/colors.dart';

Widget reGlobalUsableText(String text, {Color color= AppColors.primaryElement,
  int fontSize=16, FontWeight fontWeight = FontWeight.bold}){
  return Text(text,
    style: TextStyle(
        color: color,
        fontWeight: fontWeight, fontSize: fontSize.sp
    ),
  );
}