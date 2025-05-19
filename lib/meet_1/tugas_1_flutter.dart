import 'package:flutter/material.dart';

class tugasDua extends StatelessWidget {
  const tugasDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Saya"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle_outlined, size: 50),
          Text("Nama: Bayu", style: TextStyle(fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.location_on), Text("Jakarta")],
          ),
          Text(
            "Seorang pelajar yang sedang belajar Flutter",
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
