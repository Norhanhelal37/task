import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/font_styles.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String subTitle;
  const InfoTile({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: FontStyles.fontStyle18Weight400
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w800),
              ),
              Text(
               subTitle,
                style:
                    FontStyles.fontStyle18Weight400.copyWith(fontSize: 14.sp),
              )
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Row(
                children: [
                  Text(
                    'عرض المزيد',
                    style: FontStyles.fontStyle18Weight400
                        .copyWith(fontSize: 14.sp, color: Color(0xffCA7009)),
                  ),
                  4.hs,
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xffCA7009),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
