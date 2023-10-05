import 'package:flutter/material.dart';

enum AuthMode { signup, login }

class HomePageScreen extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var _isInit = true;
  var _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
