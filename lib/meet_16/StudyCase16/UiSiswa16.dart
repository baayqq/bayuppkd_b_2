import 'package:bayuppkd_b_2/meet_16/StudyCase16/DB_Helper16.dart';
import 'package:bayuppkd_b_2/meet_16/StudyCase16/modelUser.dart';
import 'package:flutter/material.dart';

class ScreenSiswa extends StatefulWidget {
  const ScreenSiswa({super.key});

  @override
  State<ScreenSiswa> createState() => _ScreenSiswaState();
}

class _ScreenSiswaState extends State<ScreenSiswa> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController umurController = TextEditingController();

  List<Siswa> daftarSiswa = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DBHelper16.getAllSiswa();
    setState(() {
      daftarSiswa = data;
    });
  }

  Future<void> simpanData() async {
    final nama = namaController.text;
    final umur = int.tryParse(umurController.text) ?? 0;

    if (nama.isNotEmpty && umur > 0) {
      await DBHelper16.insertSiswa(Siswa(nama: nama, umur: umur));
      namaController.clear();
      umurController.clear();
      muatData();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
