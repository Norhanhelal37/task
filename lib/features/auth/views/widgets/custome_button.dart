import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CustomeButton({super.key,required this.onPressed,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 363.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(39.r),
        color: ColorManager.mainBlue,
      ),
      child: Center(
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            )),
      ),
    );
  }
}
