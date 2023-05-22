import 'package:car_pool_app/Views/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Views/navigation/navbar.dart';
import 'Views/home_page.dart';
import 'Views/register/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agar',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
      ),
      initialRoute: LoginPage.idScreen,
      routes: {
        NavBar.idScreen: (context) => const NavBar(),
        RegisterPage.idScreen: (context) => const RegisterPage(),
        LoginPage.idScreen: (context) => LoginPage(),
        HomeScreen.idScreen: (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
