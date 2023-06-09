import 'package:car_pool_app/Views/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String idScreen = "homeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Dashboard(),
    );
  }
}
