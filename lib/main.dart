//import 'package:bayuppkd_b_2/meet_1/meet1.dart';
//import 'package:bayuppkd_b_2/meet_2/meet2_2.dart';
//import 'package:bayuppkd_b_2/meet_2/meet2_2.dart';
// 'package:bayuppkd_b_2/meet_2/meet_2.dart';
//import 'package:bayuppkd_b_2/meet_3/tugas_3a.dart';
import 'package:bayuppkd_b_2/meet_4/tugas_4.dart';
import 'package:bayuppkd_b_2/meet_5/Tugas_5.dart';
import 'package:bayuppkd_b_2/meet_5/tes.dart';
import 'package:bayuppkd_b_2/meet_5/tugas5.dart';
//import 'package:bayuppkd_b_2/meet_1/meet_2.dart';
//import 'package:bayuppkd_b_2/meet_1/tugas_1_flutter.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: TugasLima(),
    );
  }
}
