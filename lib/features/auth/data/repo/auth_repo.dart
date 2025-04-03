import 'package:dio/dio.dart';
import 'package:task/core/networking/api_services.dart';

import '../models/user_model.dart';

class AuthRepository {
  final ApiServices _apiServices;

  AuthRepository(this._apiServices);

  Future<Response> askToRegister(String email) async {
    return await _apiServices.askToRegister(email: email);
  }

  Future<void> sendOtp(String email) async {
    await _apiServices.sendOtp(email: email);
  }

  Future<void> checkOtp(String email, String otp) async {
    await _apiServices.checkOtp(email: email, otp: otp);
  }

   Future<UserModel> completeRegister({
    required String email,
    required String otp,
    required String fName,
    required String lName,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await _apiServices.completeRegister(
      email: email,
      otp: otp,
      f_name: fName,
      l_name: lName,
      phone: phone,
      password: password,
      password_confirmation: passwordConfirmation,
    );
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> logIn({
    required String email,
    required String password,
  }) async {
    final response = await _apiServices.logIn(email: email, password: password);
    return UserModel.fromJson(response.data);
  }

  Future<void> resetPassword({
    required String email,
    required String password,
    required String otp,
    required String passwordConfirmation,
  }) async {
     await _apiServices.resetPassword(
      email: email,
      password: password,
      otp: otp,
      password_confirmation: passwordConfirmation,
    );
  }
}
