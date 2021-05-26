import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication extends ChangeNotifier {
  String uid;
  String get getUid => uid;
  dynamic errorMessage = '';
  dynamic get getErrorMessage => errorMessage;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future loginIntoAccount(String email, String password) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      uid = user.uid;
      sharedPreferences.setString('uid', uid);

      notifyListeners();
    } on FirebaseException catch (e) {
      errorMessage = e.message;
    }
  }

  Future createNewAccount(String email, String password) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      uid = user.uid;
      sharedPreferences.setString('uid', uid);

      notifyListeners();
    } on FirebaseException catch (e) {
      errorMessage = e.message;
    }
  }
}
