import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/helpers/shared_pref.dart';

import '../../../core/networking/dio_factory.dart';
import '../data/repo/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final SharedPreferencesService _preferencesService;

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  AuthCubit(this._authRepository, this._preferencesService)
      : super(InitAuthState());

  

  void clearAllFields() {
    emailController.clear();
    passwordController.clear();
    fNameController.clear();
    lNameController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
    otpController.clear();
  }

  

  void updateOtp(String otp) {
    otpController.text = otp;
    log('OTP updated: $otp');
  }

  Future<void> logIn() async {
    
    emit(LoadingAuthState());
    try {
      final user = await _authRepository.logIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      await _preferencesService.saveLoginState(
          user.data.token, user.data.fName);

      DioFactory.dio!.options.headers['Authorization'] = 'Bearer ${user.data.token}';
      log(user.data.fName);
      emit(SuccessAuthState(userModel: user));
    } catch (e) {
      emit(FailureAuthState(errorMessage: e.toString()));
    }
  }

  Future<void> sendOtp() async {
    emit(LoadingAuthState());
    try {
      await _authRepository.sendOtp(
        emailController.text.trim(),
      );
      emit(SuccessAuthState());
    } catch (e) {
      emit(FailureAuthState(errorMessage: e.toString()));
    }
  }

  Future<void> sigUp() async {
    emit(LoadingAuthState());
    try {
      await _authRepository.askToRegister(
        emailController.text.trim(),
      );
      emit(SuccessAuthState());
    } catch (e) {
      emit(FailureAuthState(errorMessage: e.toString()));
    }
  }

  Future<void> checkOtp() async {
    if (otpController.text.length != 5) {
      emit(FailureAuthState(errorMessage: 'Please enter complete OTP'));
      return;
    }

    emit(LoadingAuthState());
    try {
      await _authRepository.checkOtp(
          emailController.text.trim(), otpController.text);
      emit(SuccessAuthState());
    } catch (e) {
      emit(FailureAuthState(errorMessage: e.toString()));
    }
  }

  Future<void> resetPassword() async {
    if (passwordController.text != confirmPasswordController.text) {
      emit(FailureAuthState(errorMessage: 'Passwords do not match'));
      return;
    }

    emit(LoadingAuthState());
    try {
      await _authRepository.resetPassword(
        email: emailController.text.trim(),
        otp: otpController.text,
        password: passwordController.text.trim(),
        passwordConfirmation: confirmPasswordController.text.trim(),
      );
      emit(SuccessAuthState());
    } catch (e) {
      emit(FailureAuthState(errorMessage: e.toString()));
    }
  }

  Future<void> completeRegister() async {
    // Validation
    if (passwordController.text != confirmPasswordController.text) {
      emit(FailureAuthState(errorMessage: 'Passwords do not match'));
      return;
    }

    emit(LoadingAuthState());
    try {
      final user = await _authRepository.completeRegister(
        email: emailController.text.trim(),
        fName: fNameController.text.trim(),
        lName: lNameController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text.trim(),
        passwordConfirmation: confirmPasswordController.text.trim(),
        otp: otpController.text,
      );
      await _preferencesService.saveLoginState(
          user.data.token, user.data.fName);
      emit(SuccessAuthState(userModel: user));
    } catch (e) {
      emit(FailureAuthState(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    fNameController.dispose();
    lNameController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    otpController.dispose();
    return super.close();
  }
}
