// ignore_for_file: use_build_context_synchronously
import 'package:car_pool_app/Constants/styles/styles.dart';
import 'package:car_pool_app/Constants/widgets/toast.dart';
import 'package:car_pool_app/Views/navigation/navbar.dart';
import 'package:car_pool_app/Views/register/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:car_pool_app/Constants/styles/colors.dart';
import '../../Constants/widgets/loading.dart';
import '../../main.dart';
import 'package:car_pool_app/Constants/widgets/text_field.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  static const String idScreen = "login";

  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsConst.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 18),
          child: Column(
            children: [
              const Image(
                image: AssetImage("images/login-page-bg.jpg"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.topCenter,
              ),
              const SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  child: Column(children: [
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          color: Colors.grey
                      ),
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Email",

                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        hintStyle: const TextStyle(
                          color:Colors.grey,
                          fontSize: 10,
                        ),
                        labelStyle: const TextStyle(
                          color:Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      style: const TextStyle(
                          color: Colors.grey
                      ),
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Password",

                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        hintStyle: const TextStyle(
                          color:Colors.grey,
                          fontSize: 10,
                        ),
                        labelStyle: const TextStyle(
                          color:Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // ignore: deprecated_member_use
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!emailTextEditingController.text
                                    .contains("@") ||
                                emailTextEditingController.text.isEmpty) {
                              displayToastMessage(
                                  "Invalid email address entered", context);
                            } else if (passwordTextEditingController
                                .text.isEmpty) {
                              displayToastMessage(
                                  "Password is required", context);
                            } else {
                              loginUser(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent,
                            elevation: 3,
                            shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: ColorsConst.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                          )),
                      TextSpan(
                          text: "Sign Up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushNamedAndRemoveUntil(
                                context,
                                RegisterPage.idScreen,
                                (route) => false),
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',)),
                    ])),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
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
              context, NavBar.idScreen, (route) => false);
          displayToastMessage("You have been logged in succesfully", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage(
              "User account does not exist.Please create an account", context);
        }
      });
    } else {
      Navigator.pop(context);
      displayToastMessage("Error occured, can not sign in", context);
    }
  }
}
