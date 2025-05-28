import 'package:flutter/material.dart';

class TujuhB extends StatefulWidget {
  const TujuhB({super.key});

  @override
  State<TujuhB> createState() => _TujuhBState();
}

class _TujuhBState extends State<TujuhB> {
  bool _lampu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _lampu ? Colors.black87 : Colors.white,
      body: Center(
        child: Column(
          children: [
            Switch(
              // nomor 2
              value: _lampu,
              onChanged: (value) {
                setState(() {
                  _lampu = value;
                });
              },
            ),
            Text(
              _lampu ? 'hidup' : 'mati',
              style: TextStyle(color: _lampu ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
