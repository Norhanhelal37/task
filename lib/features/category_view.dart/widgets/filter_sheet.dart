import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/category_view.dart/widgets/filter_by_type.dart';
import 'package:task/features/category_view.dart/widgets/filter_sheet_title.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';
import '../../auth/views/widgets/custome_button.dart';
import 'filter_by_topic.dart';

void filterSheet(BuildContext context) {
  final ValueNotifier<bool> bestSellingNotifier = ValueNotifier(false);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.only(right: 30.w, top: 59.h, left: 30.w),
        height: context.screenHeight * .85,
        width: context.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterSheetTitle(),
            35.vs,
            Text(
              "فلترة حسب النوع",
              style: FontStyles.fontStyle16Weight700
                  .copyWith(fontSize: 14.sp, color: ColorManager.fontGrey),
            ),
            26.vs,
            FilterByType(),
            25.vs,
            Divider(color: Color(0xffE9E9E9)),
            15.vs,
            Text(
              "حسب المبيعات",
              style: FontStyles.fontStyle16Weight700
                  .copyWith(fontSize: 14.sp, color: Color(0xff878383)),
            ),
            5.vs,

            ValueListenableBuilder<bool>(
              valueListenable: bestSellingNotifier,
              builder: (context, isChecked, child) {
                return Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        bestSellingNotifier.value = value!;
                      },
                      checkColor: Colors.white,
                      activeColor: Color(0xffCA7009),
                    ),
                    Text(
                      "المنتجات الأكثر مبيعا",
                      style: FontStyles.fontStyle18Weight400.copyWith(
                        fontSize: 12.sp,
                        color: Color(0xff25170B),
                      ),
                    ),
                  ],
                );
              },
            ),

            15.vs,
            Divider(color: Color(0xffE9E9E9)),
            15.vs,
            FilterByTopic(
              title: "حسب السعر",
              option1: "من الأقل إلى الأعلى سعرا",
              option2: "من الأعلى إلى الأقل سعرا",
            ),
            15.vs,
            Divider(color: Color(0xffE9E9E9)),
            15.vs,
            FilterByTopic(
              title: "حسب التقييم",
              option1: "من الأقل إلى الأعلى تقييما",
              option2: "من الأعلى إلى الأقل تقييما",
            ),
            25.vs,
            CustomeButton(
              text: "فلترة",
              onPressed: () {},
            ),
          ],
        ),
      );
    },
  );
}
