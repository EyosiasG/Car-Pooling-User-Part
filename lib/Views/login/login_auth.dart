import 'package:car_pool_app/Constants/widgets/loading.dart';
import 'package:car_pool_app/Constants/widgets/toast.dart';
import 'package:car_pool_app/Views/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../home_page.dart';

class LoginAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingScreen(message: "Authenticating, please wait...");
        });

    final User? firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: LoginPage().emailTextEditingController.text,
                password: LoginPage().passwordTextEditingController.text)
            // ignore: body_might_complete_normally_catch_error
            .catchError((errorMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: $errorMsg", context);
    }))
        .user;

    if (firebaseUser != null) {
      userRef.child(firebaseUser.uid).once().then((DatabaseEvent snap) {
        // ignore: unnecessary_null_comparison
        if (snap.snapshot != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.idScreen, (route) => false);
          displayToastMessage("You have been logged in succesfully", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage(
              "User account does not exist.Please create an account", context);
        }
      });
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      displayToastMessage("Error occured, can not sign in", context);
    }
  }
}
