import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/assets.dart';
import 'package:task/core/utils/colors.dart';
import 'package:task/core/utils/font_styles.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/auth/views/widgets/custome_button.dart';
import 'package:task/features/auth/views/widgets/custome_textfield.dart';
import 'package:task/features/auth/views/widgets/sub_title.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/routing/routes.dart';

import '../logic/auth_cubit.dart';
import '../logic/auth_state.dart';
import 'widgets/buttom_question.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: 36.ph,
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
                    ),
                  ),
                  Text(
                    "تسجيل الدخول",
                    style: FontStyles.fontStyle25Bold,
                  ),
                  15.vs,
                  SizedBox(
                      width: 267.w,
                      child: SubTitle(
                          subtitle:
                              "قم بإدخال بريدك الإلكتروني لتسجيل الدخول")),
                  10.vs,

                  // Email and Password TextFields
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomeTextfield(
                            controller:
                                context.read<AuthCubit>().emailController,
                            hintText: "أدخل البريد الإلكتروني",
                            prefixIcon: ImageManager.emailIcon,
                          ),
                          15.vs,
                          CustomeTextfield(
                            controller:
                                context.read<AuthCubit>().passwordController,
                            hintText: "أدخل كلمة المرور",
                            prefixIcon: ImageManager.passwordIcon,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: Icon(
                                Icons.visibility_outlined,
                                color: ColorManager.fontGrey,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  30.vs,
                  InkWell(
                    onTap: () {
                      context.pushNamed(AppRoutes.forgetPassword);
                    },
                    child: Text(
                      "هل نسيت كلمة المرور ؟",
                      style: FontStyles.fontStyle16Weight700
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  30.vs,

                  // Login Button
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoadingAuthState) {
                        CircularProgressIndicator();
                      } else if (state is FailureAuthState) {
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Login failed. Please try again.")),
                        );
                      } else if (state is SuccessAuthState) {
                        
                        Navigator.pushReplacementNamed(context, AppRoutes.homeBody);
                      }
                    },
                    child: CustomeButton(
                      text: "الدخول",
                      onPressed: () async {
                        try {
                          
                          await context.read<AuthCubit>().logIn();
                          
                        } catch (e) {
                          throw Exception("Error: ${e.toString()}");
                        }
                      },
                    ),
                  ),

                  30.vs,
                  ButtomQuestion(
                    onPressed: () {
                      context.pushNamed(AppRoutes.signUp);
                    },
                    question: "ليس لديك حساب ؟",
                    actionText: "تسجيل حساب جديد",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
