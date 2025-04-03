import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/category_view.dart/widgets/custome_option.dart';
import '../../../core/utils/font_styles.dart';

class FilterByTopic extends StatefulWidget {
  final String title;
  final String option1;
  final String option2;
  const FilterByTopic(
      {super.key,
      required this.title,
      required this.option1,
      required this.option2});

  @override
  State<FilterByTopic> createState() => _FilterByTopicState();
}

class _FilterByTopicState extends State<FilterByTopic> {
  
  final ValueNotifier<String> selectedOption = ValueNotifier("");
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(
          widget.title,
          style: FontStyles.fontStyle16Weight700
              .copyWith(fontSize: 14.sp, color: Color(0xff878383)),
        ),
        5.vs,
        Row(
          children: [
            CustomeOption(option: widget.option1,groupValueNotifier:selectedOption ,),
        28.hs,
        CustomeOption(option: widget.option2,groupValueNotifier: selectedOption,)

          ],
        )
        
      ],
    );
  }
}
