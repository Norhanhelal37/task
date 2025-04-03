import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/category_view.dart/widgets/filter_sheet.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: ColorManager.mainBlue,
          )),
      actions: [
        Padding(
          padding: EdgeInsets.only(left: 6.w),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  filterSheet(context);
                },
                child: Image.asset(ImageManager.filterEdit),
              ),
              4.hs,
              Text(
                'فلترة النتائج',
                style:
                    FontStyles.fontStyle18Weight400.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
        )
      ],
      centerTitle: true,
      title: Text(
        "مكيف جداري",
        style: FontStyles.fontStyle18Weight400
            .copyWith(color: Colors.black, fontWeight: FontWeight.w800),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
