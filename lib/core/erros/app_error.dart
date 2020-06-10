import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class Parsingfailure extends Failure {
  String response;
  Parsingfailure({this.response});
}

class UnExptectedFailure extends Failure {
  String message;
  UnExptectedFailure({@required this.message});
}
