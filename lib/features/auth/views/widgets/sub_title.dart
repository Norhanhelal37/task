import 'package:flutter/material.dart';
import '../../../../core/utils/font_styles.dart';

class SubTitle extends StatelessWidget {
  final String subtitle;
  final TextStyle? style;
  const SubTitle({super.key, required this.subtitle, this.style});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 280.w,
      // height: 106.h,
      child: Text(
        textAlign: TextAlign.center,
        subtitle,
        style:style ?? FontStyles.fontStyle18Weight400,
      ),
    );
  }
}