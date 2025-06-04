import 'package:bayuppkd_b_2/Tugas_11/Tugas11Ui.dart';
import 'package:bayuppkd_b_2/meet_16/StudyCase16/UiSiswa16.dart';
import 'package:bayuppkd_b_2/meet_16/login_screen.dart';
import 'package:bayuppkd_b_2/meet_16/register_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const String id = "/Splashb";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.keyboard_arrow_left_sharp),
        //   ),
        // ),
        title: Center(
          child: Text('Flutter Apps', style: TextStyle(fontFamily: 'Gilroy')),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 250),
              Center(
                child: Text(
                  'Welcome.',
                  style: TextStyle(fontFamily: 'Gilroy', fontSize: 40),
                ),
              ),

              SizedBox(height: 200),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TugasSebelas(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff283FB1),
                  padding: EdgeInsets.symmetric(horizontal: 160, vertical: 16),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontFamily: 'Gilroy', color: Colors.white),
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
