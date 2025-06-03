//import 'package:bayuppkd_b_2/meet_1/meet1.dart';
//import 'package:bayuppkd_b_2/meet_2/meet2_2.dart';
//import 'package:bayuppkd_b_2/meet_2/meet2_2.dart';
// 'package:bayuppkd_b_2/meet_2/meet_2.dart';
//import 'package:bayuppkd_b_2/meet_3/tugas_3a.dart';
import 'package:bayuppkd_b_2/Tugas_10/Tugas10Form.dart';
import 'package:bayuppkd_b_2/Tugas_8/tugas8.dart';
import 'package:bayuppkd_b_2/Tugas_9/HomeTugas9.dart';
import 'package:bayuppkd_b_2/meet_1/meet1.dart';
import 'package:bayuppkd_b_2/meet_12/meet_12a.dart';
import 'package:bayuppkd_b_2/Tugas_7/tugas_7Home.dart';
import 'package:bayuppkd_b_2/meet_2/meet_2.dart';
import 'package:bayuppkd_b_2/meet_3/tugas_3a.dart';
//import 'package:bayuppkd_b_2/meet_12/meet_12.dart';
import 'package:bayuppkd_b_2/meet_4/tugas_4.dart';
import 'package:bayuppkd_b_2/meet_5/Tugas_5.dart';
import 'package:bayuppkd_b_2/meet_5/tes.dart';
import 'package:bayuppkd_b_2/meet_5/tugas5.dart';
import 'package:bayuppkd_b_2/meet_6/homepage.dart';
import 'package:bayuppkd_b_2/meet_6/tugas_6.dart';
//import 'package:bayuppkd_b_2/meet_1/meet_2.dart';
//import 'package:bayuppkd_b_2/meet_1/tugas_1_flutter.dart';
import 'package:bayuppkd_b_2/Tugas_7/tugas_7Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sHOPEE',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),

      home: TugasSepuluh(),
      // initialRoute: '/TugasTujuh',
      // routes: {
      //   '/TugasTujuh': (context) => TugasTujuh(),
      //   '/tugas5': (context) => TugasLimaTes(),
      // },
    );
  }
}
