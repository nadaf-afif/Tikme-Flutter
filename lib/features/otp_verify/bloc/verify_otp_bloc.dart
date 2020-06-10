import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tikme/core/bloc_shared_pref.dart';
import 'package:tikme/core/constants.dart';
import 'package:tikme/core/depedency_injector.dart';
import 'package:tikme/core/erros/app_error.dart';
import 'package:tikme/features/otp_verify/repository/verify_otp_repository.dart';
import 'package:tikme/model/user_data.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends BaseBloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpRepository verifyOtpRepository;

  VerifyOtpBloc({@required this.verifyOtpRepository});

  @override
  VerifyOtpState get initialState => VerifyOtpInitial();

  @override
  Stream<VerifyOtpState> mapEventToState(
    VerifyOtpEvent event,
  ) async* {
    if (event is VerifyUser) {
      yield VerifyingUserState();
      final otpVerificationResponse =
          await verifyOtpRepository.verifyUserOtp(event.otp, event.user_id);
      yield* _eitherSuccessOrError(otpVerificationResponse);
    } else if (event is ValidationError) {
      yield OtpErrorState(message: event.message);
    } else if (event is OtpValueChangeEvent) {
      yield (event.isOtpValid) ? OtpValidState() : OtpInvalidState();
    } else if (event is ResendOtpEvent) {
      yield NewOtpGenerationState();
      final newOtpGenerateResponse = await verifyOtpRepository.generateNewOtp(
          event.phone_number, event.user_id, event.change_in_number);
      yield* _generateOtpSuccessOrError(newOtpGenerateResponse);
    }
  }

  Stream<VerifyOtpState> _generateOtpSuccessOrError(
      Either<Failure, UserData> successOrfail) async* {
    yield successOrfail.fold(
        (l) => OtpErrorState(message: ErrorConstants.SOMETHING_WENT_WRONG),
        (userData) {
      if (userData.status == "success") {
        return OtpGenerateSuccess(message : userData.message);
      } else {
        return OtpErrorState(message: userData.message);
      }
    });
  }

  Stream<VerifyOtpState> _eitherSuccessOrError(
      Either<Failure, UserData> successOrfail) async* {
    yield successOrfail.fold(
      (failure) {
        return OtpErrorState(message: ErrorConstants.SOMETHING_WENT_WRONG);
      },
      (userData) {
        if (userData.status == "success") {
          saveLoggedInDataInPreferences(userData, locator<SharedPreferences>());
          return VerifiedUserState(userData: userData);
        } else {
          return OtpErrorState(message: userData.message);
        }
      },
    );
  }
}
