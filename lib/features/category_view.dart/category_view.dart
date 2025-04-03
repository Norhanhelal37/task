import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/utils/colors.dart';
import 'package:task/core/utils/font_styles.dart';
import 'package:task/core/utils/sizes.dart';

import 'package:task/features/category_view.dart/widgets/appbar.dart';
import 'package:task/features/category_view.dart/widgets/category_item.dart';

class CategoryView extends StatelessWidget {
  // final categorytitle
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomeAppBar(),
      floatingActionButton: ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(ColorManager.mainBlue),
            minimumSize: WidgetStatePropertyAll(Size(281.w, 76.h)),
          ),
          onPressed: () {
            context.pushNamed(AppRoutes.askForPrice);
          },
          icon: Icon(
            Icons.add,
            size: 27.r,
            color: Colors.white,
          ),
          label: Text(
            "طلب عرض سعر",
            style: FontStyles.fontStyle16Weight700
                .copyWith(fontSize: 20.sp, color: Colors.white),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: 25.ph,
        child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.h,
          mainAxisExtent: 325.h,
          mainAxisSpacing: 10.h),
                  itemBuilder: (context, index) {
        return CategoryItem();
                  },
                ),
      ),
    ));
  }
}
