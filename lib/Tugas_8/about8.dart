import 'package:flutter/material.dart';

class AboutDelapan extends StatefulWidget {
  const AboutDelapan({super.key});

  @override
  State<AboutDelapan> createState() => _AboutDelapanState();
}

class _AboutDelapanState extends State<AboutDelapan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tugas 8",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                "Tentang Aplikasi",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 36),
            Text(
              "Applikasi dalam tahap uji coba dengan kode BETA 0.1",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
            Text(
              "Author : BAYU",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              "App Version 0.0.1",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
