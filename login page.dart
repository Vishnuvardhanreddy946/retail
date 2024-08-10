import 'package:flutter/material.dart';
import 'package:flutter_application/pages/sign_up_page.dart';

import 'login_page.dart';

class LoginandSignUp extends StatefulWidget {
  const LoginandSignUp({super.key});

  @override
  State<LoginandSignUp> createState() => _LoginandSignUpState();
}

class _LoginandSignUpState extends State<LoginandSignUp> {
  bool isLogin = true;

  void togglePage() {
    setState(() {
      isLogin = !isLogin;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return  LoginPage(
        onPressed: togglePage ,
        );
    } else {
      return  SignUp(
        onPressed: togglePage,
      );
    }
    
  }
}