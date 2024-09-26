import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showeLoginPage = true;

  void toggle() {
    showeLoginPage = !showeLoginPage;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (showeLoginPage) {
      return LoginPage(
        onTap: toggle,
      );
    } else {
      return RegisterPage(
        onTap: toggle,
      );
    }
    
  }
}
