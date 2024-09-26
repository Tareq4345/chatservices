import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/custom_button.dart';
import 'package:chatapp/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emaillController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final void Function()? onTap;
  RegisterPage({super.key, this.onTap});
  void register(BuildContext context) {
    final _auth = AuthService();
    if (_passwordController.text == _confirmPassword.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emaillController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title:  Text("password don't match"),
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
              "Let's create account for you",
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
              height: 10,
            ),
            CustomTextfield(
              hintText: 'confirm Password',
              obscureText: true,
              controller: _confirmPassword,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              text: 'Register',
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    "Login Now",
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
