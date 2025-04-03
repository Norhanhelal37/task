import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';

class CustomeOption extends StatelessWidget {
  final String option;
  final ValueNotifier<String> groupValueNotifier;

  const CustomeOption({
    super.key,
    required this.option,
    required this.groupValueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: groupValueNotifier,
      builder: (context, selectedOption, _) {
        bool isSelected = selectedOption == option;
        return Row(
          children: [
            Radio<String>(
              value: option,
              activeColor: ColorManager.mainBlue,
              fillColor: WidgetStatePropertyAll(ColorManager.mainBlue),
              groupValue: selectedOption,
              onChanged: (value) {
                if (value != null) {
                  groupValueNotifier.value = value;
                }
              },
            ),
            Text(
              option,
              style: FontStyles.fontStyle18Weight400.copyWith(
                fontSize: 12.sp,
                color: isSelected ? ColorManager.mainBlue : Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
