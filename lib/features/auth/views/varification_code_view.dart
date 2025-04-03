import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/helpers/shared_pref.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/utils/assets.dart';
import 'package:task/core/utils/colors.dart';
import 'package:task/core/utils/font_styles.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/auth/views/widgets/custome_button.dart';
import 'package:task/features/auth/views/widgets/sub_title.dart';
import 'package:task/features/auth/views/widgets/top_content.dart';
import 'package:task/features/auth/views/widgets/validation_code.dart';

import '../logic/auth_cubit.dart';
import '../logic/auth_state.dart';

class VarificationCodeView extends StatelessWidget {
  const VarificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async{
        SharedPreferencesService preferencesService = SharedPreferencesService();
        bool logged =await preferencesService.isLoggedIn();
        if (state is SuccessAuthState) {
          if(logged){
            context.pushNamed(AppRoutes.newPassword);

          }
          else{
            context.pushNamed(AppRoutes.completeInfo);

          }
        } else if (state is FailureAuthState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.errorMessage), backgroundColor: Colors.red),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            child: Column(
              children: [
                TopContent(displayedImage: ImageManager.codeStars),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 35.w, vertical: 40.h),
                    child: Column(
                      children: [
                        Text("كود التحقق",
                            style: FontStyles.fontStyle25Bold
                                .copyWith(color: Color(0xff2D2525))),
                        SubTitle(
                          subtitle:
                              "قم بكتابة كود التحقق المكون من 6 أرقام الذي تم إرساله إليك عبر البريد الإلكتروني",
                          style: FontStyles.fontStyle18Weight400
                              .copyWith(color: Color(0xff2D2525)),
                        ),
                        Text(
                          context.read<AuthCubit>().emailController.text,
                          style: FontStyles.fontStyle18Weight400
                              .copyWith(color: Color(0xff2D2525)),
                        ),
                        50.vs,
                        ValidationCode(),
                        50.vs,
                        CustomeButton(
                          onPressed: () {
                            if(context.read<AuthCubit>().otpController.text.length == 5){

                               context.read<AuthCubit>().checkOtp();
                            }
                          },
                          text: "تحقق",
                        ),
                        70.vs,
                        Text("لم يتم إرسال كود التحقق ؟",
                            style: FontStyles.fontStyle16Weight700),
                        30.vs,
                        Image.asset(ImageManager.reloadIcon),
                        InkWell(
                          onTap: () {
                            context.read<AuthCubit>().sendOtp();
                          },
                          child: Text(
                            "أرسل الكود مرة أخرى",
                            style: FontStyles.fontStyle16Weight700
                                .copyWith(color: ColorManager.mainBlue),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
