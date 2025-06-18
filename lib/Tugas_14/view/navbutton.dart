import 'package:bayuppkd_b_2/Tugas_14/view/beranda.dart';
import 'package:bayuppkd_b_2/Tugas_14/view/market.dart';
import 'package:bayuppkd_b_2/Tugas_14/view/wallet.dart';
import 'package:bayuppkd_b_2/meet_6/homepage.dart';
import 'package:flutter/material.dart';

class NavHome extends StatefulWidget {
  const NavHome({super.key});

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  int _pilihIndex = 0;
  static const List<Widget> _butonNavigator = <Widget>[
    BerandaPage(),
    MarketPage(),
    WalletPage(),
  ];

  void _pilihNavigator(int index) {
    setState(() {
      _pilihIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _butonNavigator[_pilihIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.signal_cellular_alt),
            label: 'Market',
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
        ],
        backgroundColor: Color(0xff0A0F2C),
        currentIndex: _pilihIndex,
        selectedItemColor: Color(0xFF000080),
        unselectedItemColor: Colors.white54,
        onTap: _pilihNavigator,
      ),
    );
  }
}
