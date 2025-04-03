import 'package:dio/dio.dart';
import 'package:task/core/networking/api_constant.dart';
import 'package:task/core/networking/dio_factory.dart';

class ApiServices {
  static final Dio _dio = DioFactory.getDio();

  Future<Response> askToRegister({required String email}) async {
    try {
      final Response response =
          await _dio.post(ApiConstant.askToRegister, data: {"email": email});

      return response;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future<void> sendOtp({required String email}) async {
    try {
      await _dio.get(ApiConstant.sendOtp, queryParameters: {"email": email});
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future<void> checkOtp({required String email, required String otp}) async {
    try {
      await _dio.get(ApiConstant.checkOtp,
          queryParameters: {"email": email, "otp": otp});
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future<Response> completeRegister(
      {required String email,
      required String otp,
      required String f_name,
      required String l_name,
      required String phone,
      required String password,
      required String password_confirmation}) async {
    try {
      final response = await _dio.post(ApiConstant.completeRegister, data: {
        "email": email,
        "f_name": f_name,
        "l_name": l_name,
        "phone": phone,
        "password": password,
        "password_confirmation": password_confirmation,
        "otp": otp
      });

      return response;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }

  Future<Response> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(ApiConstant.logIn, data: {
        "email": email,
        "password": password,
      });

      return response;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }


  Future<Response> resetPassword({
    required String email,
    required String password,
    required String otp,
    required String password_confirmation
  }) async {
    try {
      final response = await _dio.post(ApiConstant.logIn, data: {
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
        "otp": otp
      });

      return response;
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }
}
