import 'package:videosIn/src/modules/auth/data/model/user.dart';

abstract class AuthRepo {
  Future<UserModel> signUpUser(Map<String, dynamic> user);
  Future<UserModel> signInUser(String email, String password);
  Future<UserModel> get currentUser;
}
