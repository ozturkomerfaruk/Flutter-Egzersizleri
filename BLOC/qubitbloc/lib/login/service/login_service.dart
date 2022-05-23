// ignore_for_file: implementation_imports, avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:dio/src/dio.dart';
import 'package:qubitbloc/login/model/login_response.dart';
import 'package:qubitbloc/login/model/login_request_model.dart';
import 'package:qubitbloc/login/service/ILoginService.dart';

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model) async {
    final response = await dio.post(loginPath, data: model);

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
