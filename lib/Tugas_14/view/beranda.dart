import 'package:flutter/material.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120), // <-- atur tinggi di sini
        child: AppBar(
          title: Text('McLaren Cryp', style: TextStyle(color: Colors.white70)),
          backgroundColor: Color(0xff0A0F2C),
          centerTitle: true,
        ),
      ),
      backgroundColor: Color(0xff0A0F2C),
    );
  }
}
