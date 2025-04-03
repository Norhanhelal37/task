import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/font_styles.dart';

class RateBrand extends StatefulWidget {
  const RateBrand({super.key});

  @override
  State<RateBrand> createState() => _RateBrandState();
}

class _RateBrandState extends State<RateBrand> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/brand_test.png",
            height: 21.h,
            width: 79.w,
          ),
          20.hs,
          SizedBox(
            width: 119.w,
            height: 15.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  5,
                  (index) {
                    if (index == 4) {
                      return Image.asset(ImageManager.unactiveStar);
                    }
                    return Image.asset(ImageManager.activeStar);
                  },
                ),
                Text("(4.3)",
                    style: FontStyles.fontStyle16Weight700
                        .copyWith(fontSize: 14.sp, color: Color(0xffCA7009))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
