import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task/core/utils/font_styles.dart';
import 'package:task/core/utils/sizes.dart';
import 'package:task/features/auth/logic/auth_cubit.dart';
import 'package:task/features/auth/logic/auth_state.dart';
import 'package:task/features/auth/views/widgets/custome_button.dart';
import 'package:task/features/auth/views/widgets/sub_title.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';
import 'widgets/custome_textfield.dart';

class CompleteInfo extends StatelessWidget {
  const CompleteInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoadingAuthState) {
                    CircularProgressIndicator();
                  } else if (state is FailureAuthState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(" Please try again.")),
                    );
                  } else if (state is SuccessAuthState) {
                    Navigator.pushReplacementNamed(context, AppRoutes.homeBody);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageManager.user,
                      width: 100,
                      height: 100,
                    ),
                    35.vs,
                    Text(
                      "إستكمال البيانات",
                      style: FontStyles.fontStyle25Bold,
                    ),
                    SubTitle(
                      subtitle:
                          "قم بإستكمال بياناتك الشخصية لتتمكن من تسجيل حسابك",
                      style: FontStyles.fontStyle18Weight400
                          .copyWith(color: Color(0xff2D2525)),
                    ),
                    35.vs,
                    CustomeTextfield(
                      hintText: "الاسم الأول",
                      controller: context.read<AuthCubit>().fNameController,
                    ),
                    10.vs,
                    CustomeTextfield(
                      hintText: "الاسم الأخير",
                      controller: context.read<AuthCubit>().fNameController,
                    ),
                    10.vs,
                    CustomeTextfield(
                      hintText: "رقم الجوال",
                      controller: context.read<AuthCubit>().phoneController,
                    ),
                    10.vs,
                    CustomeTextfield(
                      hintText: "كلمة المرور",
                      controller: context.read<AuthCubit>().passwordController,
                      suffixIcon: Icon(
                        Icons.visibility_outlined,
                        color: ColorManager.fontGrey,
                      ),
                    ),
                    10.vs,
                    CustomeTextfield(
                      hintText: "تأكيد كلمة المرور",
                      controller:
                          context.read<AuthCubit>().confirmPasswordController,
                      suffixIcon: Icon(
                        Icons.visibility_outlined,
                        color: ColorManager.fontGrey,
                      ),
                    ),
                    18.vs,
                    CustomeButton(
                        onPressed: () {
                          context.read<AuthCubit>().completeRegister();
                        },
                        text: "تأكيد")
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
