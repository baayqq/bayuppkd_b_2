//import 'package:bayuppkd_b_2/meet_1/meet1.dart';
//import 'package:bayuppkd_b_2/meet_2/meet2_2.dart';
//import 'package:bayuppkd_b_2/meet_2/meet2_2.dart';
// 'package:bayuppkd_b_2/meet_2/meet_2.dart';
//import 'package:bayuppkd_b_2/meet_3/tugas_3a.dart';
import 'package:bayuppkd_b_2/Splass/SplassScreenA.dart';
import 'package:bayuppkd_b_2/Splass/SplassScreenB.dart';
import 'package:bayuppkd_b_2/Tugas_10/Tugas10Form.dart';
import 'package:bayuppkd_b_2/Tugas_11&12/Tugas11Ui.dart';
import 'package:bayuppkd_b_2/Tugas_14/view/list_screen.dart';
import 'package:bayuppkd_b_2/Tugas_8/tugas8.dart';
import 'package:bayuppkd_b_2/Tugas_9/HomeTugas9.dart';
import 'package:bayuppkd_b_2/meet_1/meet1.dart';
import 'package:bayuppkd_b_2/meet_12/meet_12a.dart';
import 'package:bayuppkd_b_2/Tugas_7/tugas_7Home.dart';
import 'package:bayuppkd_b_2/meet_16/register_screen.dart';
import 'package:bayuppkd_b_2/meet_2/meet_2.dart';
import 'package:bayuppkd_b_2/meet_22/view/user_list_screen.dart';
import 'package:bayuppkd_b_2/meet_3/tugas_3a.dart';
//import 'package:bayuppkd_b_2/meet_12/meet_12.dart';
import 'package:bayuppkd_b_2/meet_4/tugas_4.dart';
import 'package:bayuppkd_b_2/meet_5/Tugas_5.dart';
import 'package:bayuppkd_b_2/meet_5/tes.dart';
import 'package:bayuppkd_b_2/meet_5/tugas5.dart';
import 'package:bayuppkd_b_2/meet_6/homepage.dart';
import 'package:bayuppkd_b_2/meet_16/login_screen.dart';
import 'package:bayuppkd_b_2/meet_6/tugas_6.dart';
//import 'package:bayuppkd_b_2/meet_1/meet_2.dart';
//import 'package:bayuppkd_b_2/meet_1/tugas_1_flutter.dart';
import 'package:bayuppkd_b_2/Tugas_7/tugas_7Home.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sHOPEE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),

      home: ScreenApp(),
      // initialRoute: SplashScreen.id,
      // routes: {
      //   SplashScreen.id: (context) => const SplashScreen(),
      //   Splash.id: (context) => const Splash(),
      //   LoginSreenAPP.id: (context) => LoginSreenAPP(),
      //   RegisterScreenAPP.id: (co.ntext) => RegisterScreenAPP(),
      // },
    );
  }
}
