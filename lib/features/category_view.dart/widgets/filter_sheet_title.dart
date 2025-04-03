import 'package:flutter/material.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/font_styles.dart';

class FilterSheetTitle extends StatelessWidget {
  const FilterSheetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(ImageManager.filterEdit),
        7.hs,
        Text(
          'فلترة النتائج',
          style: FontStyles.fontStyle18Weight400
              .copyWith(fontWeight: FontWeight.w800, color: Colors.black),
        ),
      ],
    );
  }
}
