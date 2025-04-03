import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/font_styles.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/product_details/widgets/amount.dart';
import 'package:task/features/product_details/widgets/cart_button.dart';
import 'package:task/features/product_details/widgets/custome_productbar.dart';
import 'package:task/features/product_details/widgets/deliver_filter.dart';
import 'package:task/features/product_details/widgets/mini_images.dart';
import 'package:task/features/product_details/widgets/product_slider.dart';
import 'package:task/features/product_details/widgets/rate_brand.dart';
import 'package:task/features/product_details/widgets/reviews.dart';
import '../../core/utils/colors.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final PageController pageController = PageController();
  final ValueNotifier<int> current = ValueNotifier(0);
  final ValueNotifier<int> amount = ValueNotifier(0);
  final ValueNotifier<String> filterType = ValueNotifier("");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomeProductbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductSlider(current: current, pageController: pageController),
            10.vs,
            MiniImages(current: current),
            15.vs,
            Padding(
              padding: EdgeInsets.only(bottom: 35.h, left: 35.w, right: 35.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "مكيف كاسيت جري 1.5 حصان",
                    style: FontStyles.fontStyle16Weight700
                        .copyWith(color: Colors.black, fontSize: 20.sp),
                  ),
                  20.vs,
                  RateBrand(),
                  20.vs,
                  SizedBox(
                    child: Text(
                        style: TextStyle(
                            color: ColorManager.fontGrey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300),
                        "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف.عوضاً عن استخدام هنا يوجد محتوى نصي، هنا يوجد محتوى نصي فتجعلها تبدو "),
                  ),
                  20.vs,
                  Text(
                    " 2,750.00 ر.س ",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: Color(0xffCA7009)),
                  ),
                  20.vs,
                  DeliverFilter(
                    filter: filterType,
                  ),
                  24.vs,
                  Amount(amount: amount),
                  25.vs,
                  CartButton(),
                  25.vs,
                  Reviews()
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
