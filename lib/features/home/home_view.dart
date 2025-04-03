import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/helpers/shared_pref.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/home/widgets/best_saler_list.dart';
import 'package:task/features/home/widgets/categories.dart';
import 'package:task/features/home/widgets/custome_appbar.dart';
import 'package:task/features/home/widgets/home_slider.dart';
import 'package:task/features/home/widgets/info_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late String? usernameFuture;
  @override
  void initState() {
    usernameFuture = SharedPreferencesService.prefs?.getString("username");
    log(usernameFuture.toString());
    super.initState();
  }

  final ValueNotifier<int> current = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 32.h, left: 32.w, right: 32.w),
          child: Column(
            children: [
              CustomeAppbar(username: usernameFuture,),
              HomeSlider(current: current, pageController: _pageController),
              Categories(),
              36.vs,
              InfoTile(
                  title: "الأكثر مبيعا",
                  subTitle: "أكثر منتجاتنا تحقيقا للمبيعات"),
              36.vs,
              BestSalerList(),
              64.vs,
              InfoTile(
                  title: "فتحات التكييف الألومنيوم",
                  subTitle: "مبيعات فتحات التكييف الألومنيوم المتاحة لدينا"),
              36.vs,
              BestSalerList()
            ],
          ),
        ),
      ),
    ));
  }
}
