import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class ProductSlider extends StatefulWidget {
  final ValueNotifier<int> current;
  final PageController pageController;
  const ProductSlider(
      {super.key, required this.current, required this.pageController});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 242.h,
      width: 460.w,
      // width: do,
      color: ColorManager.fieldGrey..withValues(alpha: .2),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: widget.pageController,
              onPageChanged: (value) {
                widget.current.value = value;
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                return Image.asset(
                  "assets/images/test_product.png",
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            // bottom: 30.h,
            child: SizedBox(
              width: 77.w,
              height: 19.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => ValueListenableBuilder<int>(
                    valueListenable: widget.current,
                    builder: (context,_,value) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: index == widget.current.value ? 35.w : 5.w,
                        height: index == widget.current.value? 5.h : 12.h,
                        decoration: BoxDecoration(
                          color: index == widget.current.value
                              ? Color(0xffCA7009)
                              : Color(0xffCA7009).withValues(alpha: 0.7),
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                      );
                    }
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
