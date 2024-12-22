import 'package:app/features/login/presentation/pages/login_page.dart';
import 'package:app/features/sign_up/presentation/pages/sign_up.dart';
import 'package:app/shared/button/app_primary_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome.",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AppPrimaryButton(
              title: "Go to Login Page",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            AppPrimaryButton(
              title: "Go to Sign Up Page",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
