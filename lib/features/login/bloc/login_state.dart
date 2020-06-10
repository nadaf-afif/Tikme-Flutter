part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginRequest extends LoginState {}

class LoggedIn extends LoginState {
  final UserData userData;
  LoggedIn(this.userData) : super();
}

class ValidUserState extends LoginState {
  final OtpGenerationResponse otpResponse;
  ValidUserState({@required this.otpResponse});
}

class UserInvalidError extends LoginState {
  final String message;
  final String mobileNumber;
  UserInvalidError({@required this.message, @required this.mobileNumber});
}