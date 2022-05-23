// ignore: duplicate_ignore
// ignore_for_file: file_names, constant_identifier_names

import 'package:dio/dio.dart';
import 'package:qubitbloc/login/model/login_request_model.dart';
import 'package:qubitbloc/login/model/login_response.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);

  final String loginPath = ILoginServicePath.LOGIN.rawValue;

  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model);
}

enum ILoginServicePath {
  LOGIN,
}

extension ILoginServicePathExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.LOGIN:
        return "/login";
      default:
        return "";
    }
  }
}
