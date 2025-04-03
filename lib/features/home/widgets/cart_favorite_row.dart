import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';

class CartFavoriteRow extends StatelessWidget {
  const CartFavoriteRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(115.w, 39.h)),
              backgroundColor: WidgetStatePropertyAll(Color(0xffFFFFFF))),
          icon: Image.asset(
            ImageManager.cartIcon,
            color: ColorManager.mainBlue,
            width: 18.w,
            height: 18.h,
          ),
          onPressed: () {},
          label: Text(
            "أضف للعربة",
            style: FontStyles.fontStyle16Weight700
                .copyWith(fontSize: 11.sp, color: ColorManager.mainBlue),
          ),
        ),
        5.hs,
        InkWell(
          onTap: () {},
          child: Image.asset(ImageManager.favoriteIcon),
        )
      ],
    );
  }
}
