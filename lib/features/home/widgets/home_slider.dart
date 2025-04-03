import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/networking/api_constant.dart';
import 'package:task/features/home/data/models/home_slider_model.dart';
import 'package:task/features/home/logic/home_cubit.dart';

import '../logic/home_state.dart';

class HomeSlider extends StatefulWidget {
  final ValueNotifier<int> current;
  final PageController pageController;
  const HomeSlider(
      {super.key, required this.current, required this.pageController});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  void initState() {
    context.read<HomeCubit>().fetchSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return CircularProgressIndicator();
        } else if (state is HomeFailure) {
          return Center(child: Text("Something went wrong"));
        } else if (state is HomeSuccess) {
          List<SliderData> sliders = state.data as List<SliderData>;

          return Container(
            width: 370.w,
            height: 204.h,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.only(top: 20.h, bottom: 24.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(38.r)),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: widget.pageController,
                  itemCount: sliders.length,
                  onPageChanged: (index) {
                    widget.current.value = index;
                  },
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(right: 10.w),
                        foregroundDecoration: BoxDecoration(
                          color: Colors.black.withAlpha(70),
                          borderRadius: BorderRadius.all(Radius.circular(38.r)),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              ApiConstant.baseUrl+sliders[index].image,
                          placeholder: (context, url) =>
                              SizedBox(height: 24.h,width: 24.w,child: Icon(Icons.image_search_rounded)),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ));
                  },
                ),
                Positioned(
                  bottom: 10.h,
                  child: SizedBox(
                    width: 77.w,
                    height: 19.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        sliders.length,
                        (index) => ValueListenableBuilder<int>(
                          valueListenable: widget.current,
                          builder: (context, value, child) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: index == value ? 35.w : 5.w,
                              height: index == value ? 5.h : 12.h,
                              decoration: BoxDecoration(
                                color: index == value
                                    ? Colors.white
                                    : Colors.white.withValues(alpha: 0.7),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text("لا يوجد بيانات متاحة"));
        }
      },
    );
  }
}
