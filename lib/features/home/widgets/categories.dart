import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 455.h,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 144.w,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.h,
            crossAxisCount: 2),
        itemCount: 6,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.pushNamed(AppRoutes.categoryView);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: ColorManager.categotryColor[index],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/category_test.png"),
                  10.vs,
                  Text(
                    "مكيف كاسيت",
                    style: FontStyles.fontStyle16Weight700
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
