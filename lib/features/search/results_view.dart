import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task/features/search/widgets/custome_results_bar.dart';

import '../category_view.dart/widgets/category_item.dart';


class ResultsView extends StatelessWidget {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomeResultsBar(),

        body: Padding(
          padding: EdgeInsets.only(top:20.w,left: 36.w,right: 36.w,),
          child:  GridView.builder(
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
      )
      );
  }
}