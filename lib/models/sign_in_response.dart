// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromMap(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toMap());

class SignInResponse extends Equatable {
  final String token;

  SignInResponse({
    @required this.token,
  });

  SignInResponse copyWith({
    String token,
  }) =>
      SignInResponse(
        token: token ?? this.token,
      );

  factory SignInResponse.fromMap(Map<String, dynamic> json) => SignInResponse(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };

  @override
  List<Object> get props => [token];

  @override
  bool get stringify => true;
}
