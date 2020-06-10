part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final String phoneNumber;
  LoginUser({@required this.phoneNumber});
}

class ErrorEvent extends LoginEvent {
  final String message;
  final String mobileNumber;
  ErrorEvent({@required this.message, @required this.mobileNumber});
}

