// ignore_for_file: use_build_context_synchronously

import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/custom_button.dart';
import 'package:chatapp/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emaillController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;

  LoginPage({super.key, this.onTap});

  Future<void> login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
        _emaillController.text,
        _passwordController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Wellcome back, you've been missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: _emaillController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              text: 'Login',
              onTap: () {},
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
