import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubitbloc/login/service/login_service.dart';

import '../viewmodel/login_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String baseUrl = 'https://regres.in/api';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        formKey,
        emailController,
        passwordController,
        service: LoginService(
          Dio(
            BaseOptions(
              baseUrl: baseUrl,
            ),
          ),
        ),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return buildScaffold(context, state);
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context, LoginState state) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Qubit Login"),
          leading: Visibility(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
            visible: context.watch<LoginCubit>().isLoading,
          )),
      body: Form(
        key: formKey,
        autovalidateMode: state is LoginValidateState
            ? (state.isValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled)
            : AutovalidateMode.disabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            email(),
            const SizedBox(height: 10),
            password(),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().postUserModel();
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField password() {
    return TextFormField(
      controller: passwordController,
      validator: (value) => (value!.length > 3) ? null : "3'ten Kucuk",
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Password",
      ),
    );
  }

  TextFormField email() {
    return TextFormField(
      controller: emailController,
      validator: (value) => (value!.length > 5) ? null : "5'ten Kucuk",
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Email",
      ),
    );
  }
}
