import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/utils/assets.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(39.r),
        color: ColorManager.fieldGrey,
      ),
      clipBehavior: Clip.hardEdge,
      child: TextFormField(
        clipBehavior: Clip.hardEdge,
        maxLines: 1,
        style: FontStyles.fontStyle16Weight700.copyWith(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: InkWell(
            onTap: () {
              context.pushNamed(AppRoutes.searchResults);
            },
            child: Image.asset(ImageManager.searchIcon),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 29.h, horizontal: 20.w),
          focusedBorder: borderstyle(),
          enabledBorder: borderstyle(),
          
          border: borderstyle(),
          hintText: "أدخل كلمة البحث",
          hintStyle: FontStyles.fontStyle16Weight700,
        ),
      ),
    );
  }

  OutlineInputBorder borderstyle() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(39.r),
        borderSide:
            const BorderSide(color: ColorManager.fieldGrey, width: 1.5));
  }
}
