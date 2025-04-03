import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';

import '../../../core/utils/colors.dart';

class DeliverFilter extends StatefulWidget {
  
  final ValueNotifier<String> filter;

  const DeliverFilter(
      {super.key,required this.filter});

  @override
  State<DeliverFilter> createState() => _DeliverFilterState();
}

class _DeliverFilterState extends State<DeliverFilter> {
  final List<String> services = [
    "توريد فقط",
    "توريد وتركيب بدون نحاس",
    " 10 متر نحاس  +توريد وتركيب "
  ];
  final List<String> prices = [
    "لا يوجد سعر إضافي",
    "+ 500 ر.س",
    "+ 850 ر.س"
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: widget.filter,
        builder: (context, c, v) {
          return SizedBox(
            height: 104.h,
            width: 380.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                  3,
                  (index) {
                    return InkWell(
                      onTap: () {
                        widget.filter.value = services[index];
                      },
                      child: Container(
                        width: 117.w,
                        height: 104.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffEFF5F9)


                          ),
                          color: widget.filter.value == services[index]
                              ? Color(0xffEFF5F9)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          children: [
                            10.vs,
                            Radio(
                              value: services[index],
                              activeColor: ColorManager.mainBlue,
                              groupValue: widget.filter.value,
                              onChanged: (value) {
                                widget.filter.value = value!;
                              },
                            ),
                            Text(services[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: widget.filter.value == services[index]
                                      ? ColorManager.mainBlue
                                      : Colors.black,
                                )),
                            5.vs,
                            Text(
                              prices[index],
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: services[index] ==  widget.filter.value
                                      ? ColorManager.mainBlue
                                      : Color(0xffCA7009)),
                            ),
                            
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        });
  }
}
