import 'package:app/features/home/presentation/pages/home_page.dart';
import 'package:app/features/welcome/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> checkTokenAvailable() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");

    if (token != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    checkTokenAvailable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
