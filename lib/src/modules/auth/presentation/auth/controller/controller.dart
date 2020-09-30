import 'package:mobx/mobx.dart';
import 'package:videosIn/src/modules/auth/data/model/user.dart';
import 'package:videosIn/src/modules/auth/data/repo/repo_imp.dart';

part 'controller.g.dart';

class AuthController extends _AuthController with _$AuthController {}

abstract class _AuthController with Store {
  final repository = AuthRepoImp();

  @observable
  UserModel userModel;

  @action
  Future<void> getUser() async {
    userModel = await repository.currentUser;
  }

  @action
  void setUser(UserModel userModel) {
    if (userModel == null) this.userModel = userModel;
  }
}
