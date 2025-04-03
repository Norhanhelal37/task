import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/font_styles.dart';

class ButtomQuestion extends StatelessWidget {
  final String question;
  final String actionText;
  final Function()? onPressed;
  const ButtomQuestion(
      {super.key,
      required this.question,
      required this.actionText,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: FontStyles.fontStyle18Weight400
              .copyWith(color: ColorManager.fontGrey),
        ),
        5.vs,
        Center(
          child: ListTile(
            contentPadding: EdgeInsets.only(right: 80.w, left: 80.w),
            onTap: onPressed,
            trailing: Padding(
              padding: EdgeInsets.only(top: 9.h),
              child: Icon(
                Icons.arrow_forward_sharp,
                color: ColorManager.mainBlue,
              ),
            ),
            title: Text(
              actionText,
              style: FontStyles.fontStyle18Weight400.copyWith(
                  height: 0,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.mainBlue),
            ),
          ),
        ),
      ],
    );
  }
}
