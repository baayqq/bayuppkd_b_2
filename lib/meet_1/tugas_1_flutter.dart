import 'package:flutter/material.dart';

class tugasDua extends StatelessWidget {
  const tugasDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Saya"),
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(child: Column(children: [Text("login")])),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Icon(Icons.account_circle_outlined, color: Colors.green, size: 190),
          Text("Nama : Bayu", style: TextStyle(fontSize: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.location_on), Text("Jakarta")],
          ),
          Text(
            "Seorang pelajar yang sedang belajar Flutter",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
