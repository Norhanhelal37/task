import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/font_styles.dart';
import 'package:task/core/utils/sizes.dart';

import 'core/utils/assets.dart';

class CustomeNavigationBar extends StatefulWidget {
  final ValueNotifier<int> index;
  const CustomeNavigationBar({super.key, required this.index});

  @override
  State<CustomeNavigationBar> createState() => _CustomeNavigationBarState();
}

class _CustomeNavigationBarState extends State<CustomeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: 100.h,
      padding: EdgeInsets.only(top:30.h,right: 50.w,left: 50.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(17.r),
          topRight: Radius.circular(17.r),
        ),
      ),

      child: SizedBox(
        width: 320.w,
        height: 60.h,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _customeItem(
              ImageManager.homeIcon,
              "الرئسية",0
              
            ),

            _customeItem(ImageManager.cartIcon, "العربة",1),
            _customeItem(ImageManager.projectsIcon, "مشاريعنا",2),

            _customeItem(ImageManager.worksIcon, "أعمالنا",3),

            _customeItem(ImageManager.moreIcon, "المزيد",4),


            

          ],
        ),

      ),
    );
  }

  Column _customeItem(String icon, String label,int place) {
    return Column(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: widget.index,
          builder: (context, value, child) {
            return Column(
                    children: [
                      InkWell(
                        onTap: () {
        
                          widget.index.value = place;
                          
                          
                        },
                        child: Image.asset(
                          icon,
                          width: 24.w,
                          height: 24.h,
                        ),
            
                      ),
                      Text(label,style: FontStyles.fontStyle18Weight400.copyWith(fontSize: 14.sp)
                      ,)
                    ],
                  );
          }
        ),
      ],
    );
  }
}