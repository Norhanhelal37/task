import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets.dart';

class TopContent extends StatelessWidget {
  final String displayedImage;
  const TopContent({super.key, required this.displayedImage});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.only(left: 30.h, top: 50.h),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageManager.codedBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(child: Image.asset(displayedImage)),
        ));
  }
}
