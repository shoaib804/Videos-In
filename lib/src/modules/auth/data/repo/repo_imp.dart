import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:videosIn/src/modules/auth/data/model/user.dart';
import 'package:videosIn/src/modules/auth/data/repo/repo.dart';

class AuthRepoImp extends AuthRepo {
  final _userCollection = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> get currentUser async {
    try {
      final fUser = _auth.currentUser;
      if (fUser == null) return null;

      final userDoc = await _userCollection.doc(fUser.uid).get();

      return UserModel.fromJson(userDoc.data());
    } catch (e) {
      print('User Get Error: $e');
      return null;
    }
  }

  @override
  Future<UserModel> signInUser(String email, String password) async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authResult.user != null) {
        final userDoc = await _userCollection.doc(authResult.user.uid).get();
        print(userDoc.data());
        return UserModel.fromJson(userDoc.data());
      }
      return null;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message);
      return null;
    }
  }

  @override
  Future<UserModel> signUpUser(Map<String, dynamic> user) async {
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
          email: user['email'], password: user['password']);

      user = {
        ...user,
        'uid': authResult.user.uid,
      };

      await _userCollection.doc(authResult.user.uid).set(user);
      return UserModel.fromJson(user);
    } on FirebaseAuthException catch (e) {
      Modular.to.pop();
      Fluttertoast.showToast(msg: e.message, toastLength: Toast.LENGTH_LONG);
      print('Error at registration: $e');
      return null;
    }
  }
}
