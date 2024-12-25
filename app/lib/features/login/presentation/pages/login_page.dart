import 'package:app/features/home/presentation/pages/home_page.dart';
import 'package:app/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:app/features/sign_up/presentation/pages/sign_up.dart';
import 'package:app/shared/button/app_primary_button.dart';
import 'package:app/shared/text_input/app_text_input.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
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

  void login() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<LoginBloc>(context).add(
        Login(
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
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }

            if (state is LoginSuccess) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login.",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppPrimaryButton(
                    title: "Login",
                    onTap: login,
                    isLoading: state is LoginLoading,
                    isDisabled: state is LoginLoading,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 19,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign Up",
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
            );
          },
        ),
      ),
    );
  }
}
