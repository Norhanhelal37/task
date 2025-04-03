import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';

class CustomeButton extends StatelessWidget {
  final String lable;
  final Function()? onTap;
  const CustomeButton({super.key, required this.lable, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size(363.w, 76.h),
            ),
            backgroundColor: WidgetStatePropertyAll(ColorManager.mainBlue)),
        child: Text(
          lable,
          style: FontStyles.fontStyle18Weight400
              .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ));
  }
}
