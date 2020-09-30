import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:videosIn/src/modules/auth/data/repo/repo_imp.dart';
import 'package:videosIn/src/modules/auth/presentation/auth/controller/controller.dart';

part 'controller.g.dart';

class SignInController extends _SignInController with _$SignInController {}

abstract class _SignInController with Store {
  String email, password;
  final key = GlobalKey<FormState>();
  final repository = AuthRepoImp();
  final authController = Modular.get<AuthController>();

  @observable
  bool isLoading = false;

  @action
  Future<void> signInUser() async {
    isLoading = true;
    final userModel = await repository.signInUser(email, password);
    if (userModel != null) {
      authController.setUser(userModel);

      isLoading = false;
    } else {
      isLoading = false;
    }
  }

  Future<void> validateForm() async {
    if (key.currentState.validate()) {
      key.currentState.save();
      await signInUser();
    }
  }
}
