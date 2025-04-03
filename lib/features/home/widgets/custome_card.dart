import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/font_styles.dart';
import 'cart_favorite_row.dart';

class CustomeCard extends StatelessWidget {
  const CustomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.productDetails);
      },
      child: SizedBox(
        height: 295,
        width: 177.w,
        child: Card(
          elevation: 5,
          borderOnForeground: true,
          color: Color(0xffFFFFFF),
          child: Column(
            children: [
              Container(
                height: 87.h,
                width: 184.w,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 7,
                      color: const Color.fromARGB(255, 194, 192, 192)
                          .withValues(alpha: .1))
                ]),
                child: Image.asset("assets/images/category_test.png"),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "مكيف كاسيت جري 1.5 حصان",
                      style: FontStyles.fontStyle16Weight700
                          .copyWith(color: Colors.black),
                    ),
                    7.vs,
                    Image.asset("assets/images/brand_test.png"),
                    7.vs,
                    Text(
                      "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما  ",
                      style: FontStyles.fontStyle18Weight400
                          .copyWith(fontSize: 10.sp),
                    ),
                    7.vs,
                    Text(
                      "2,750.00 ر.س",
                      style: FontStyles.fontStyle16Weight700
                          .copyWith(fontSize: 14.sp, color: Color(0xffCA7009)),
                    ),
                    7.vs,
                    CartFavoriteRow()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
