import 'dart:io';

import 'package:car_pool_app/Constants/styles/colors.dart';
import 'package:car_pool_app/Constants/widgets/loading.dart';
import 'package:car_pool_app/Constants/styles/styles.dart';
import 'package:car_pool_app/Views/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../Constants/widgets/toast.dart';
import '../../main.dart';
import '../Navigation/navbar.dart';
import 'package:car_pool_app/Constants/widgets/text_field.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  static const String idScreen = "register";

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  String imageUrl = '';
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  // final _firestore = FirebaseFirestore.instance;
  String _email = '';
  String _password = '';
  String _fullName = '';
  String _phoneNumber = '';
  File? _userImage;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _userImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate() && _userImage != null) {
      _formKey.currentState!.save();
      try {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return LoadingScreen(message: "Registering, please wait...");
            });
        final userCredential = await _auth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
          Navigator.pop(context);
          return displayToastMessage("Error: $errMsg", context);
        });
        final imageUploadTask = await _storage
            .ref('userImages/${userCredential.user!.uid}.jpg')
            .putFile(_userImage!);
        final imageUrl = await imageUploadTask.ref.getDownloadURL();
        await userRef.child(userCredential.user!.uid).set({
          "email": emailTextEditingController.text.trim(),
          "fullName": nameTextEditingController.text.trim(),
          'imageUrl': imageUrl,
          'phoneNumber': phoneTextEditingController.text.trim(),
        });

        // ignore: use_build_context_synchronously
        displayToastMessage(
            "Congratulations,your account has been created", context);
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
            context, NavBar.idScreen, (route) => false);
      } catch (ex) {
        Navigator.pop(context);
        displayToastMessage("User account has not been created", context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsConst.white,
      appBar: AppBar(
        backgroundColor: ColorsConst.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 18),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    child: Column(children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            _userImage != null ? FileImage(_userImage!) : null,
                      ),
                      TextButton.icon(
                          onPressed: _pickImage,
                          icon: const Icon(Icons.image),
                          label: const Text('Add User Image')),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      TextFieldForm(
                        capitalization: TextCapitalization.words,
                        controller: nameTextEditingController,
                        textInputAction: TextInputAction.next,
                        text: "Full Name",
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFieldForm(
                        capitalization: TextCapitalization.none,
                        controller: phoneTextEditingController,
                        textInputAction: TextInputAction.next,
                        text: "Phone Number",
                        textInputType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFieldForm(
                        capitalization: TextCapitalization.none,
                        controller: emailTextEditingController,
                        textInputAction: TextInputAction.next,
                        text: "Email",
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: passwordTextEditingController,
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: StylesConst.textBorder,
                            focusedBorder: StylesConst.textBorder,
                            fillColor: ColorsConst.grey100,
                            filled: true,
                            label: const Text("Password"),
                            labelStyle: StylesConst.labelStyle,
                            hintStyle: StylesConst.hintStyle),
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: StylesConst.buttonTheme,
                            onPressed: () {
                              if (nameTextEditingController.text.length < 4 ||
                                  nameTextEditingController.text.isEmpty) {
                                displayToastMessage(
                                    "Name must be at least 4 characters",
                                    context);
                              } else if (!emailTextEditingController.text
                                      .contains("@") ||
                                  emailTextEditingController.text.isEmpty) {
                                displayToastMessage(
                                    "Invalid email address entered", context);
                              } else if (phoneTextEditingController
                                      .text.isEmpty ||
                                  phoneTextEditingController.text.length < 10) {
                                displayToastMessage(
                                    "Invalid phone number", context);
                              } else if (passwordTextEditingController
                                      .text.length <
                                  8) {
                                displayToastMessage(
                                    "Password must be at least 8 characters",
                                    context);
                              } else {
                                _registerUser();
                              }
                            },
                            child: const Center(
                                child: Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: ColorsConst.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: ColorsConst.black)),
                        TextSpan(
                            text: "Sign In",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LoginPage.idScreen,
                                  (route) => false),
                            style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsConst.blue)),
                      ])),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
