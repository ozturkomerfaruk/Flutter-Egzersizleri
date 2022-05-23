import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:qubitbloc/login/service/ILoginService.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  final ILoginService service;

  bool isLoginFail = false;
  bool isLoading = false;

  LoginCubit(
    this.formKey,
    this.emailController,
    this.passwordController, {
    required this.service,
  }) : super(LoginInitial());

  void postUserModel() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      Future.delayed(Duration(seconds: 2));
    } else {
      isLoginFail = true;
      emit(LoginValidateState(isLoginFail)); //sayfaya haber vermek için
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoadingState(isLoading));
  }
}
