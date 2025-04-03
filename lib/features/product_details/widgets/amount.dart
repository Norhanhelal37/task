import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/sizes.dart';

class Amount extends StatefulWidget {
  final ValueNotifier<int> amount;
  const Amount({super.key, required this.amount});

  @override
  State<Amount> createState() => _AmountState();
}

class _AmountState extends State<Amount> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: widget.amount,
        builder: (context, c, v) {
          return Center(
            child: SizedBox(
              height: 74.h,
              width: 140.w,
              child: Column(
                children: [
                  Text(
                    "حدد الكمية المطلوبة",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                  10.vs,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          widget.amount.value += 1;
                        },
                        child: Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(color: Color(0xff292D32))),
                          child: Center(child: Icon(Icons.add)),
                        ),
                      ),
                      Text(
                        "${widget.amount.value}",
                        style: TextStyle(
                            fontSize: 29.sp, fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {
                          if(widget.amount.value <= 0){

                          }
                          else{

                          widget.amount.value -= 1;
                          }
                        },
                        child: Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(color: Color(0xff292D32))),
                          child: Center(child: Icon(Icons.remove)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
