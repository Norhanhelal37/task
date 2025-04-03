import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';
import 'custome_review.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(ImageManager.activeStar),
            7.hs,
            Text(
              "تقييمات المنتج",
              style: FontStyles.fontStyle16Weight700
                  .copyWith(fontSize: 14.sp, color: Colors.black),
            )
          ],
        ),
        7.vs,
        Text(
          "عرض لجميع التقييمات على هذا المنتج",
          style: FontStyles.fontStyle18Weight400
              .copyWith(fontSize: 14.sp, color: ColorManager.fontGrey),
        ),
        26.vs,
        ...List.generate(
          4,
          (index) {
            return CustomeReview();
          },
        )
      ],
    );
  }
}
