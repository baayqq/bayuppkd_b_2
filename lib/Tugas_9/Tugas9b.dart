import 'package:flutter/material.dart';

class TugasSembilanB extends StatefulWidget {
  const TugasSembilanB({super.key});

  @override
  State<TugasSembilanB> createState() => _TugasSembilanBState();
}

class _TugasSembilanBState extends State<TugasSembilanB> {
  final List<Map<String, dynamic>> data = [
    {'nama': 'Buah-buahan', "icon": Icons.apple},
    {'nama': 'Sayuran', "icon": Icons.grass_sharp},
    {'nama': 'Elektronik', "icon": Icons.computer},
    {'nama': 'Pakaian Pria', "icon": Icons.man_sharp},
    {'nama': 'Pakaian Wanita', "icon": Icons.woman},
    {'nama': 'Alat Tulis Kantor', "icon": Icons.app_registration_outlined},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tugas 9b",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff031716),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(data[index]['icon']),
            title: Text("${data[index]["nama"]}"),
          );
        },
      ),
    );
  }
}
