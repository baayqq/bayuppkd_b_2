import 'package:bayuppkd_b_2/Splass/SplassScreenB.dart';
import 'package:bayuppkd_b_2/helper/preference.dart';
import 'package:bayuppkd_b_2/meet_16/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "/Splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changePage() {
    Future.delayed(Duration(seconds: 3), () async {
      bool isLogin = await PreferenceHandler.getLogin();
      print("isLogin: $isLogin");
      if (isLogin) {
        return Navigator.pushNamedAndRemoveUntil(
          context,
          Splash.id,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Splash.id,
          (route) => false,
        ); // Splash B
      }
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            // Image.asset(AppImage.pisang),
            SizedBox(height: 20),
            Text(
              "Flutter Apps",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Spacer(),
            SafeArea(child: Text("v 1.0.0", style: TextStyle(fontSize: 10))),
          ],
        ),
      ),
    );
  }
}
