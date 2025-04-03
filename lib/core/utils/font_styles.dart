import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/colors.dart';

class FontStyles {
  FontStyles._();

  static TextStyle fontStyle25Bold =
      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold);

  static TextStyle fontStyle18Weight400 = TextStyle(
      height: 2.h,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: ColorManager.fontGrey);

  static TextStyle fontStyle16Weight700 = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: ColorManager.fontGrey);
}
