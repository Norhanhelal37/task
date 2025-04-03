import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';

class CustomeResultsBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeResultsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            10.vs,
            
            Text(
              "نتائج البحث",
              style: FontStyles.fontStyle18Weight400
                  .copyWith(fontWeight: FontWeight.w800, color: Colors.black),
            ),

            Align(
              alignment: Alignment.center,
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageManager.searchIcon,color: ColorManager.fontGrey,),
                  8.hs,
                  Text(
                    "تكييف جري 1.5 حصان",
                    style: FontStyles.fontStyle18Weight400.copyWith(fontSize: 14.sp,color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        toolbarHeight: 76.h,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: ColorManager.mainBlue,
            )),
      );
  }
  
  @override
  
  Size get preferredSize => Size.fromHeight(70.h);
}