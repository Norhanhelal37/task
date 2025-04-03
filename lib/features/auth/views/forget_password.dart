import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/auth/logic/auth_cubit.dart';
import 'package:task/features/auth/logic/auth_state.dart';
import 'package:task/features/auth/views/widgets/custome_button.dart';
import 'package:task/features/auth/views/widgets/custome_textfield.dart';
import 'package:task/features/auth/views/widgets/sub_title.dart';
import 'package:task/features/auth/views/widgets/top_content.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/font_styles.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Form(
                child: Column(children: [
              TopContent(
                displayedImage: ImageManager.emailFogetPass,
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                      padding:
                          EdgeInsets.only(left: 35.w, top: 70.h, right: 35.w),
                      child: BlocListener<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is LoadingAuthState) {
                              CircularProgressIndicator();
                            } else if (state is FailureAuthState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        " Please try again.")),
                              );
                            } else if (state is SuccessAuthState) {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.varifyCode);
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "هل نسيت كلمة المرور ؟",
                                style: FontStyles.fontStyle25Bold,
                              ),
                              SubTitle(
                                  style: FontStyles.fontStyle18Weight400
                                      .copyWith(color: Color(0xff2D2525)),
                                  subtitle:
                                      "قم بإدخال بريدك الإلكتروني لإرسال كود التحقق"),
                              60.vs,
                              CustomeTextfield(
                                  controller: context
                                      .read<AuthCubit>().emailController
                                      
                                  ,hintText: "أدخل البريد الإلكتروني",
                                  prefixIcon: ImageManager.emailIcon),
                              35.vs,
                              CustomeButton(
                                  onPressed: () async {
                                    try {
                                      await context.read<AuthCubit>().sendOtp();
                                      
                                    } 
                                    catch (e) {
                                      throw Exception("Error: ${e.toString()}");
                                    }
                                  },
                                  text: "إرسال"),
                            ],
                          ))))
            ]))));
  }
}
