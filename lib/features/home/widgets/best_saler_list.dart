import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/features/home/widgets/custome_card.dart';


class BestSalerList extends StatelessWidget {
  const BestSalerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 310.h,

                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) {
                          return CustomeCard();
                        },
                      )
                    ],
                  ),
                ),
              );
  }
}