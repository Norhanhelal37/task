import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/helpers/shared_pref.dart';
import 'package:task/core/routing/app_route.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/generated/l10n.dart';

import 'core/di/dependencies.dart';
import 'features/auth/logic/auth_cubit.dart';

class AbfApp extends StatelessWidget {
  const AbfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider<AuthCubit>(
          create: (context) => sl<AuthCubit>(),
          child: MaterialApp(
            initialRoute: SharedPreferencesService().getToken() != null ? AppRoutes.homeBody : "/",
            onGenerateRoute: AppRoute.generateRoute,
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            theme: ThemeData(
              fontFamily: 'Almarai-Regular',
            ),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar', ''),
          ),
        );
      },
    );
  }
}


