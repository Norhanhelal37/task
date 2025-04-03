import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task/core/networking/api_constant.dart';

import '../helpers/shared_pref.dart';

class DioFactory {
  DioFactory();

  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = const Duration(seconds: 40)
        ..options.receiveTimeout = const Duration(seconds: 45)
        ..options.headers = {
          "Accept": "application/json",
          "Accept-Language": "ar"
        }
        ..options.baseUrl = ApiConstant.baseUrl
        ..interceptors.add(PrettyDioLogger(
            requestBody: true,
            responseBody: true,
            requestHeader: true,
            responseHeader: true));

      dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            String? token = SharedPreferencesService.prefs?.getString("token");
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            return handler.next(options);
          },
        ),
      );
      return dio!;
    } else {
      return dio!;
    }
  }
}
