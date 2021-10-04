
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/constant.dart';

class SplashPage extends StatelessWidget {

  static const routeName = '/splash_screen';

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, Routes.home)
    );

    return Scaffold(
      backgroundColor: Color(0xFFEC2E1A),
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}