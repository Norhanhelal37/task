import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';

class CustomeAppbar extends StatelessWidget {
  final String? username;
  const CustomeAppbar({super.key, this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${username?? "اسم المستخدم"},مرحبا ",
          style: FontStyles.fontStyle16Weight700.copyWith(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        LeadingIcons(
          background: ColorManager.fieldGrey,
          imagePath: ImageManager.searchIcon,
          onTap: () {
            context.pushNamed(AppRoutes.searchPage);
          },
        ),
        10.hs,
        LeadingIcons(
            imagePath: ImageManager.whatsAppIcon, background: Color(0xff1ABF00))
      ],
    );
  }
}

class LeadingIcons extends StatelessWidget {
  final String imagePath;
  final Color background;
  final Function()? onTap;
  const LeadingIcons({
    super.key,
    required this.imagePath,
    required this.background,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: background,
        radius: 25.r,
        child: Image.asset(
          imagePath,
          width: 25.w,
          height: 25.h,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
