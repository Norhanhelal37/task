import 'package:flutter/material.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/features/auth/views/complete_info.dart';
import 'package:task/features/auth/views/forget_password.dart';
import 'package:task/features/auth/views/login_view.dart';
import 'package:task/features/auth/views/new_password.dart';
import 'package:task/features/auth/views/sign_up_view.dart';
import 'package:task/features/auth/views/varification_code_view.dart';
import 'package:task/features/product_details/details_view.dart';
import 'package:task/features/search/results_view.dart';
import 'package:task/features/search/search_view.dart';

import 'package:task/home_body.dart';

import '../../features/category_view.dart/ask_for_price_view.dart';
import '../../features/category_view.dart/category_view.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => LoginView()
          ,
          settings: settings,
        );

        case AppRoutes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordView()
        );

        case AppRoutes.varifyCode
        :
        return MaterialPageRoute(
          builder: (_) => VarificationCodeView()
        );


        case AppRoutes.newPassword
        :
        return MaterialPageRoute(
          builder: (_) => NewPassword()
        );

        case AppRoutes.signUp
        :
        return MaterialPageRoute(
          builder: (_) => SignUpView()
        );

        case AppRoutes.completeInfo
        :
        return MaterialPageRoute(
          builder: (_) => CompleteInfo()
        );

      

        case AppRoutes.homeBody:
        return MaterialPageRoute(

          builder: (_) => const HomeBody(),
          settings: settings,

        );

        case AppRoutes.categoryView:
        return MaterialPageRoute(
          builder: (_) => Hero(tag: AppRoutes.categoryView,child: const CategoryView()),
          settings: settings,
        );

        case AppRoutes.askForPrice:
        return MaterialPageRoute(
          builder: (_) => Hero(tag:AppRoutes.askForPrice ,child: const AskForPriceView()),
          settings: settings,
        );

        case AppRoutes.searchResults:
        return MaterialPageRoute(
          builder: (_) => Hero(tag:AppRoutes.searchResults ,child: const ResultsView()),
          settings: settings,
        );

        case AppRoutes.searchPage:
        return MaterialPageRoute(
          builder: (_) => Hero(tag:AppRoutes.searchPage ,child: const SearchView()),
          settings: settings,
        );

        case AppRoutes.productDetails:
        return MaterialPageRoute(
          builder: (_) => Hero(tag:AppRoutes.productDetails ,child: const DetailsView()),
          settings: settings,
        );
      
      


      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('Page Not Found')),
                ));
    }
  }
}
