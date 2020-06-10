part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class VerifyUser extends VerifyOtpEvent {
  final int user_id;
  final String otp;

  VerifyUser({
    @required this.user_id,
    @required this.otp,
  });
}


class OtpValueChangeEvent extends VerifyOtpEvent{
  bool isOtpValid;
  OtpValueChangeEvent({@required this.isOtpValid});
}

class ValidationError extends VerifyOtpEvent {
  String message;
  ValidationError({@required this.message});
}

class ResendOtpEvent extends VerifyOtpEvent {
  
  String phone_number;
  int user_id;
  bool change_in_number;

  ResendOtpEvent(
      {@required this.phone_number,
      @required this.user_id,
      @required this.change_in_number});
}

