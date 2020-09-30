class UserModel {
  final String email;
  String userId = '';

  UserModel({this.email, this.userId});

  static Map<String, dynamic> toJson(UserModel user) {
    final userJson = {
      'email': user.email,
    };

    return userJson;
  }

  factory UserModel.fromJson(Map<String, dynamic> userJson) {
    return UserModel(
      email: userJson['email'],
      userId: userJson['uid'],
    );
  }
}
