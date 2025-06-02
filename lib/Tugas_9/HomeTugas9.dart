import 'package:bayuppkd_b_2/Tugas_7/tugas_7Home.dart';
import 'package:bayuppkd_b_2/Tugas_8/about8.dart';
import 'package:flutter/material.dart';

class SembilanHome extends StatefulWidget {
  const SembilanHome({super.key});

  @override
  State<SembilanHome> createState() => _SembilanHomeState();
}

class _SembilanHomeState extends State<SembilanHome> {
  int _pilihIndex = 0;
  static const List<Widget> _butonNavigator = <Widget>[
    TugasTujuh(title: 'Tugas 9'),
    AboutDelapan(),
  ];

  void _pilihNavigator(int index) {
    setState(() {
      _pilihIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _butonNavigator.elementAt(_pilihIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        currentIndex: _pilihIndex,
        selectedItemColor: Colors.amber,
        onTap: _pilihNavigator,
      ),
    );
  }
}
