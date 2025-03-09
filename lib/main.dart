import 'package:flutter/material.dart';
import 'package:finalproject/login/patient/home_screen.dart';
import 'package:finalproject/login/selection_screen.dart';
import 'package:finalproject/login/nurse/signup_nurse_screen.dart';
import 'login/splash_screen.dart';
import 'login/onboarding_screen.dart';
import 'login/patient/patient_login_screen.dart';
import 'login/patient/signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690), // Adjust based on your design
      minTextAdapt: true,
      builder: (context, child) => const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        SelectionScreen.routeName: (context) => const SelectionScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        SignupNurseScreen.routeName: (context) => SignupNurseScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}