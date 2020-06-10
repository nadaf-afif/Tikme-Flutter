import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tikme/core/constants.dart';
import 'package:tikme/features/login/repository/login_repository.dart';
import 'package:tikme/model/user_data.dart';
import 'package:tikme/core/erros/app_error.dart';
import '../data/otp_generate_response.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc({@required this.loginRepository});

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUser) {
      yield LoginRequest();
      final userData = await loginRepository.validateUser(event.phoneNumber);
      yield* _eitherSuccessOrError(userData);
    } else if (event is ErrorEvent) {
      yield UserInvalidError(message: event.message, mobileNumber: event.mobileNumber);
    }
  }

  Stream<LoginState> _eitherSuccessOrError(
      Either<Failure, OtpGenerationResponse> successOrfail) async* {
    yield successOrfail.fold(
      (failure) {
        return UserInvalidError(message: ErrorConstants.SOMETHING_WENT_WRONG, mobileNumber: "");
      },
      (otpData) {
        if (otpData.status == "success") {
          return ValidUserState(otpResponse: otpData);
        } else {
          return UserInvalidError(message: otpData.message, mobileNumber: "");
        }
      },
    );
  }

  bool isNumberValid(String mobileNumber) {
    return (mobileNumber.isNotEmpty && mobileNumber.length > 9);
  }
}
