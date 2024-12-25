import 'package:app/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:app/features/sign_up/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:app/features/splash/presentation/pages/splash_page.dart';
import 'package:app/init_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initDependency();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(
          create: (BuildContext context) => SignUpBloc(
            signUpUseCase: getIt(),
          ),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(
            loginUseCase: getIt(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashPage(),
    );
  }
}
