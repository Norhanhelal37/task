import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';

class CustomeReview extends StatelessWidget {
  const CustomeReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(34.w),
      width: 365.w,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
          color: Color(0xffF6F6F6), borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 26.h,
                width: 26.w,
                child: Image.asset(
                  ImageManager.user,
                  color: ColorManager.mainBlue,
                ),
              ),
              7.hs,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "محمود الشهراني",
                    style: FontStyles.fontStyle18Weight400
                        .copyWith(fontSize: 14.sp, color: Colors.black),
                  ),
                  Text(
                    "منذ 3 أشهر",
                    style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w300,
                        color: ColorManager.fontGrey),
                  ),
                ],
              ),
              Spacer(),
              displayedRates(),
            ],
          ),
          SizedBox(
            width: 290.w,
            child: Text(
                textAlign: TextAlign.start,
                style: FontStyles.fontStyle18Weight400
                    .copyWith(fontSize: 12.sp, color: ColorManager.fontGrey),
                "هنا يكتب تقييم المستخدم الذي قام بتقييمه للمنتج عند الشراء"),
          )
        ],
      ),
    );
  }




  SizedBox displayedRates() {
    return SizedBox(
             
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (index) {
                      if (index == 4) {
                        return Image.asset(
                          ImageManager.unactiveStar,
                          width: 12.w,
                          height: 12.h,
                        );
                      }
                      return Image.asset(ImageManager.activeStar,
                          width: 12.w, height: 12.h);
                    },
                  ),
                  4.hs,
                  Text("(4.3)",
                      style: FontStyles.fontStyle16Weight700.copyWith(
                          fontSize: 12.sp, color: Color(0xffCA7009))),
                ],
              ),
            );
  }
}
