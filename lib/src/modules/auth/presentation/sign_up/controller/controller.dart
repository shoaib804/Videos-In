import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:videosIn/src/modules/auth/data/repo/repo_imp.dart';
import 'package:videosIn/src/modules/auth/presentation/auth/controller/controller.dart';

part 'controller.g.dart';

class SignUpController extends _SignUpController with _$SignUpController {}

abstract class _SignUpController with Store {
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final repository = AuthRepoImp();

  String email, password, confirmPassword;

  @observable
  bool isLoading = false;

  bool validateEmail(String _email) {
    if (_email.contains('@') && _email.contains('.com')) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword(String _password) {
    if (_password.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  bool validateConfirmPassword(String _cPassword) {
    if (_cPassword != passwordController.text) {
      return false;
    } else {
      return true;
    }
  }

  @action
  Future<void> formValidate() async {
    isLoading = true;
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      final user = {
        'email': email,
        'password': password,
      };
      final userModel = await repository.signUpUser(user);
      if (userModel != null) {
        Modular.get<AuthController>().setUser(userModel);
        while (Modular.to.canPop()) {
          Modular.to.pop();
        }
      }
      isLoading = false;
    }
    isLoading = false;
  }
}
