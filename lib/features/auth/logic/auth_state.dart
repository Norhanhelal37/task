import 'package:task/features/auth/data/models/user_model.dart';


abstract class AuthState {}

class InitAuthState extends AuthState{}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
   UserModel? userModel;

  SuccessAuthState({this.userModel});
}

class FailureAuthState extends AuthState {
  final String errorMessage;

  FailureAuthState({required this.errorMessage});
}
