import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/features/auth/logic/auth_cubit.dart';
import '../../../../core/utils/font_styles.dart';

class ValidationCode extends StatefulWidget {
  const ValidationCode({super.key});

  @override
  State<ValidationCode> createState() => _ValidationCodeState();
}

class _ValidationCodeState extends State<ValidationCode> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(5, (index) => TextEditingController());
    focusNodes = List.generate(5, (index) => FocusNode());
  }



  @override
  void dispose() {
    for (TextEditingController controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index <= 4) {
        FocusScope.of(context).previousFocus();
      } else {
        FocusScope.of(context).unfocus();
      }
    }
    _updateOtp();
  }

  void _updateOtp() {
    final otp = controllers.map((c) => c.text.toString()).join();
    final reversedOtp = otp.split('').reversed.join();
    context.read<AuthCubit>().updateOtp(reversedOtp);
  }

  final List<ValueNotifier<bool>> enteredStates =
      List.generate(5, (index) => ValueNotifier(false));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        return ValueListenableBuilder<bool>(
          valueListenable: enteredStates[index],
          builder: (context, isFilled, child) {
            return SizedBox(
              height: 60.h,
              width: 60.w,
              child: CircleAvatar(
                backgroundColor: enteredStates[index].value
                    ? const Color(0xff2D2525)
                    : const Color(0xffF4F4F4),
                child: TextFormField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  maxLength: 1,
                  cursorHeight: 15.h,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: FontStyles.fontStyle18Weight400.copyWith(
                    color: isFilled ? Colors.white : Colors.black,
                    fontSize: 25.sp,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                  ),
                  onChanged: (value) => _onChanged(value, index),
               
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
