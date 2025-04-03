import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/utils/font_styles.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/auth/views/widgets/custome_textfield.dart';

import 'package:task/features/category_view.dart/widgets/custome_button.dart';

import '../../core/utils/colors.dart';

class AskForPriceView extends StatelessWidget {
  const AskForPriceView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Column(
          children: [
            
            Text(
              "طلب عرض سعر",
              style: FontStyles.fontStyle18Weight400
                  .copyWith(fontWeight: FontWeight.w800, color: Colors.black),
            ),

            Text(
              "يمكنك إرسال طلب عرض سعر خاص",
              style: FontStyles.fontStyle18Weight400.copyWith(fontSize: 14.sp),
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
      ),
      body: Padding(
        padding: EdgeInsets.all(36.w),
        child: Form(
          child: Column(
            children: [
              CustomeTextfield(hintText: "الاسم الأول"),
              10.vs,
              CustomeTextfield(hintText: "الاسم الأخير"),
              10.vs,
              CustomeTextfield(hintText: "البريد الإلكتروني"),
              10.vs,
              CustomeTextfield(hintText: "رقم الجوال"),
              10.vs,
              CustomeTextfield(
                  hintText:
                      "أعمال الصيانة - أعمال الصيانة ـDUCT - المشاريع - المنتجات"),
              10.vs,
              CustomeTextfield(
                hintText: "نص الرسالة",
                maxline: 6,
              ),
              26.vs,
              CustomeButton(lable: "إرسال الطلب")
             
         ] ),
        ),
      ),
    ));
  }
}
