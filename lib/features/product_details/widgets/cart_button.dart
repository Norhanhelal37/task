import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {},
        icon: Image.asset(
          ImageManager.cartIcon,
          color: Colors.white,
        ),
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(ColorManager.mainBlue),
            minimumSize: WidgetStatePropertyAll(Size(363.w, 76.h))),
        label: Text(
          "إضافة إلى عربة التسوق",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ));
  }
}
