import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';

class CustomeProductbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomeProductbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70.h,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: InkWell(
              onTap: () {},
              child: Image.asset(ImageManager.favoriteIcon),
            ),
          )
        ],
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: ColorManager.mainBlue,
            )),
        title: Text(
          "تفاصيل المنتج",
          style: FontStyles.fontStyle18Weight400
              .copyWith(color: Colors.black, fontWeight: FontWeight.w800),
        ),
      );
  }
  
  @override
  
  Size get preferredSize => Size.fromHeight(70.h);
}