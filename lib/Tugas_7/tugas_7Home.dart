import 'package:bayuppkd_b_2/Tugas_7/7a.dart';
import 'package:bayuppkd_b_2/Tugas_7/7b.dart';
import 'package:bayuppkd_b_2/Tugas_7/7d.dart';
import 'package:bayuppkd_b_2/Tugas_7/7c.dart';
import 'package:bayuppkd_b_2/Tugas_7/7e.dart';
import 'package:flutter/material.dart';
import 'package:bayuppkd_b_2/constant/app_color.dart';
import 'package:bayuppkd_b_2/constant/app_style.dart';

class TugasTujuh extends StatefulWidget {
  final String title;
  const TugasTujuh({super.key, this.title = 'Tugas 7'});

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

class _TugasTujuhState extends State<TugasTujuh> {
  // bool _cekBox = false;
  // bool _lampu = false;
  // String? isSelected;
  // DateTime? selectDate;
  // TimeOfDay? selectedTime;
  int _selectedIndex = 0;
  List<Widget> listScreen = [TujuhA(), TujuhB(), TujuhC(), TujuhD(), TujuhE()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: listScreen[_selectedIndex],
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/pat.jpg"),
              ),
              SizedBox(height: 20),
              Text(
                "Bayu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.check_box),
                title: Text('Check Box'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.dark_mode_outlined),
                title: Text('Switch'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.list_sharp),
                title: Text('Drop Down'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Tanggal'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.access_time_outlined),
                title: Text('Jam'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
