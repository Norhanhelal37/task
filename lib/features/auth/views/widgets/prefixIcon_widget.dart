import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/colors.dart';

class EmailPrefixiconWidget extends StatelessWidget {
  final String icon;
  const EmailPrefixiconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      width: 90.w,
      child: Row(
        children: [
          40.hs,
          Image.asset(
            ImageManager.emailIcon,
            width: 24.w,
            height: 24.h,
          ),
          VerticalDivider(
            endIndent: 18.h,
            indent: 18.h,
            color: ColorManager.fontGrey,
          ),
        ],
      ),
    );
  }
}
