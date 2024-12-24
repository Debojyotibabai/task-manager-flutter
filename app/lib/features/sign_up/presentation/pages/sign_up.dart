import 'package:app/features/login/presentation/pages/login_page.dart';
import 'package:app/features/sign_up/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:app/shared/button/app_primary_button.dart';
import 'package:app/shared/text_input/app_text_input.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return "email address is required";
    } else if (!Constants.emailRegExp.hasMatch(value.trim())) {
      return "email address is invalid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return "password is required";
    } else if (!Constants.passwordRegExp.hasMatch(value.trim())) {
      return "Upper, lower, digit, special, 8+ characters";
    }
    return null;
  }

  void signup() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<SignUpBloc>(context).add(
        SignUp(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign Up.",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AppTextInput(
                controller: nameController,
                hintText: "Full Name",
              ),
              SizedBox(
                height: 15,
              ),
              AppTextInput(
                controller: emailController,
                hintText: "Email Address",
                validator: validateEmail,
              ),
              SizedBox(
                height: 15,
              ),
              AppTextInput(
                controller: passwordController,
                hintText: "Password",
                validator: validatePassword,
              ),
              SizedBox(
                height: 20,
              ),
              AppPrimaryButton(
                title: "Sign Up",
                onTap: signup,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 19,
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
