import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/utils/assets.dart';
import 'package:task/core/utils/font_styles.dart';
import 'package:task/features/search/widgets/search_field.dart';

import '../../core/utils/colors.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 70.h,
          title: Text("البحث",style: FontStyles.fontStyle18Weight400.copyWith(fontWeight: FontWeight.w800,color: Colors.black),),
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: ColorManager.mainBlue,
            )),
        ),

        body: Padding(
          padding: EdgeInsets.only(top:45.h,left: 35.w,right: 35.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SearchField(
            
                ),

              Expanded(
                child: Image.asset(ImageManager.searchedNotFoundIcon)
                )
            ],

          ),
          ),
      )
      );
  }
}