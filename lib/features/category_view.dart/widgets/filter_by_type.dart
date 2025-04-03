import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterByType extends StatefulWidget {
  const FilterByType({super.key});

  @override
  State<FilterByType> createState() => _FilterByTypeState();
}

class _FilterByTypeState extends State<FilterByType> {
  final ValueNotifier<List<bool>> selectedValues =
      ValueNotifier(List.generate(11, (index) => false));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 354.w,
      height: 160.h,
      child: ValueListenableBuilder<List<bool>>(
        valueListenable: selectedValues,
        builder: (context, values, child) {
          return GridView.builder(
            itemCount: values.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 30.h,
              mainAxisSpacing: 10.h,
            ),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Checkbox(
                    value: values[index],
                    checkColor: Colors.white,
                    activeColor: const Color(0xffCA7009),
                    onChanged: (value) {
                      selectedValues.value = List.from(selectedValues.value)
                        ..[index] = value!;
                    },
                  ),
                  Image.asset("assets/images/brand_test.png"),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
