import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task/core/utils/sizes.dart';
import 'package:task/features/auth/logic/auth_cubit.dart';
import 'package:task/features/auth/logic/auth_state.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/font_styles.dart';
import 'widgets/custome_button.dart';
import 'widgets/custome_textfield.dart';
import 'widgets/sub_title.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: 36.ph,
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoadingAuthState) {
                  CircularProgressIndicator();
                } else if (state is FailureAuthState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(" Please try again.")),
                  );
                } else if (state is SuccessAuthState) {
                  Navigator.pushReplacementNamed(context, AppRoutes.varifyCode);
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  70.vs,
                  Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 50.w, right: 50.w, bottom: 30.h),
                      child: Image.asset(
                        ImageManager.loginLogo,
                        width: 260.w,
                        height: 175.h,
                      )),
                  Text(
                    "تسجيل حساب جديد",
                    style: FontStyles.fontStyle25Bold,
                  ),
                  15.vs,
                  SizedBox(
                      width: 267.w,
                      child: SubTitle(
                          subtitle:
                              "قم بإدخال بريدك الإلكتروني لتسجيل حساب جديد")),
                  20.vs,
                  CustomeTextfield(
                    hintText: "أدخل البريد الإلكتروني",
                    controller: context.read<AuthCubit>().emailController,
                    prefixIcon: ImageManager.emailIcon,
                  ),
                  30.vs,
                  CustomeButton(
                    text: "تسجيل",
                    onPressed: () {
                      context.read<AuthCubit>().sigUp();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
