import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class MiniImages extends StatefulWidget {
  final ValueNotifier<int> current;
  const MiniImages({super.key, required this.current});

  @override
  State<MiniImages> createState() => _MiniImagesState();
}

class _MiniImagesState extends State<MiniImages> {
  @override
  Widget build(BuildContext context) {
    return Center(
              child: SizedBox(
                height: 70.h,
                width: 367.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      4,
                      (index) {
                        return ValueListenableBuilder<int>(
                            valueListenable: widget.current,
                            builder: (context, c, v) {
                              return InkWell(
                                onTap: () {
                                  widget.current.value = index;
                                },
                                child: Container(
                                  height: 70.w,
                                  width: 80.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: widget.current.value == index?ColorManager.fontGrey:Colors.white
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: widget.current.value == index
                                        ? Colors.white
                                        : Color(0xffF4F4F4),
                                  ),
                                  child: Image.asset("assets/images/category_test.png"),
                                ),
                              );
                            });
                      },
                    )
                  ],
                ),
              ),
            );
  }
}
