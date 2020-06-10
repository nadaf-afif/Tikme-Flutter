part of 'verify_otp_bloc.dart';

abstract class VerifyOtpState extends Equatable {
  @override
  List<Object> get props => [];
}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyingUserState extends VerifyOtpState {}

class VerifiedUserState extends VerifyOtpState {
  final UserData userData;
  VerifiedUserState({@required this.userData});
}

class OtpErrorState extends VerifyOtpState {
  final String message;
  OtpErrorState({@required this.message});
}

class OtpGenerateSuccess extends VerifyOtpState {
  String message;
  OtpGenerateSuccess({@required this.message});
}

class OtpValidState extends VerifyOtpState {}

class OtpInvalidState extends VerifyOtpState {}

class NewOtpGenerationState extends VerifyOtpState {}
