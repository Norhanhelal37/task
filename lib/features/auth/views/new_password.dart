import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/routing/extensions.dart';
import 'package:task/core/utils/assets.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/auth/views/widgets/custome_button.dart';
import 'package:task/features/auth/views/widgets/top_content.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/font_styles.dart';
import '../logic/auth_cubit.dart';
import '../logic/auth_state.dart';
import 'widgets/custome_textfield.dart';
import 'widgets/sub_title.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopContent(displayedImage: ImageManager.emailFogetPass),
          BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoadingAuthState) {
                  CircularProgressIndicator();
                } else if (state is FailureAuthState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please try again.")),
                  );
                } else if (state is SuccessAuthState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Successfully done")),
                  );

                  Navigator.pushReplacementNamed(context, AppRoutes.homeBody);
                }
              },
              child: Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(left: 35.w, top: 70.h, right: 35.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "كلمة المرور الجديدة",
                        style: FontStyles.fontStyle25Bold,
                      ),
                      SizedBox(
                        width: 285.w,
                        child: SubTitle(
                            style: FontStyles.fontStyle18Weight400
                                .copyWith(color: Color(0xff2D2525)),
                            subtitle:
                                "قم بتعيين كلمة المرور الجديدة الخاصة بحسابك"),
                      ),
                      60.vs,
                      CustomeTextfield(
                          controller:
                              context.read<AuthCubit>().passwordController,
                          hintText: "كلمة المرور الجديدة",
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: ColorManager.fontGrey,
                          ),
                          prefixIcon: ImageManager.passwordIcon),
                      25.vs,
                      CustomeTextfield(
                          controller: context
                              .read<AuthCubit>()
                              .confirmPasswordController,
                          hintText: "تأكيد كلمة المرور الجديدة",
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: ColorManager.fontGrey,
                          ),
                          prefixIcon: ImageManager.passwordIcon),
                      40.vs,
                      CustomeButton(
                          onPressed: () {
                            context.read<AuthCubit>().resetPassword();
                            context.pushNamed("/");
                          },
                          text: "تأكيد"),
                    ],
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
