import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/font_styles.dart';
import 'package:task/core/utils/sizes.dart';
import '../../../../core/utils/colors.dart';

class CustomeTextfield extends StatefulWidget {
  final String hintText;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final int? maxline;
  final TextEditingController ?controller;
  const CustomeTextfield(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.maxline, this.controller});

  @override
  State<CustomeTextfield> createState() => _CustomeTextfieldState();
}

class _CustomeTextfieldState extends State<CustomeTextfield> {
  final ValueNotifier<bool> obsecured = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(39.r),
        color: ColorManager.fieldGrey,
      ),
      clipBehavior: Clip.hardEdge,
      // height: 80.h,
      // width: 363.2,
      child: ValueListenableBuilder<bool>(
          valueListenable: obsecured,
          builder: (context, isObsecured, child) {
            return TextFormField(
              controller: widget.controller,
              clipBehavior: Clip.hardEdge,
              obscureText: isObsecured,
              maxLines: widget.maxline ?? 1,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      obsecured.value = !obsecured.value;
                    },
                    child: (widget.suffixIcon != null)
                        ? !(obsecured.value)
                            ? widget.suffixIcon
                            : Icon(Icons.visibility_off_outlined)
                        : SizedBox()),
                prefixIcon: widget.prefixIcon != null
                    ? SizedBox(
                        height: 24.h,
                        width: 90.w,
                        child: Row(
                          children: [
                            40.hs,
                            Image.asset(
                              widget.prefixIcon ?? "",
                              width: 24.w,
                              height: 24.h,
                            ),
                            SizedBox(
                              height: 15.h,
                              child: VerticalDivider(
                                // endIndent: 18.h,
                                // indent: 18.h,
                                color: ColorManager.fontGrey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 29.h, horizontal: 20.w),
                focusedBorder: borderstyle(),
                enabledBorder: borderstyle(),
                border: borderstyle(),
                hintText: widget.hintText,
                hintStyle: FontStyles.fontStyle16Weight700,
              ),
            );
          }),
    );
  }

  OutlineInputBorder borderstyle() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(39.r),
        borderSide:
            const BorderSide(color: ColorManager.fieldGrey, width: 1.5));
  }
}
