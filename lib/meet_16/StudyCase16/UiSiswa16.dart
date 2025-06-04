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
    return Scaffold(
      appBar: AppBar(title: Text('Pendaftaran Siswa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: umurController,
              decoration: InputDecoration(labelText: 'Umur'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 36),
            ElevatedButton(onPressed: simpanData, child: Text('Simpan')),
            Divider(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: daftarSiswa.length,
                itemBuilder: (context, index) {
                  final Siswa = daftarSiswa[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${Siswa.id}')),
                    title: Text(Siswa.nama),
                    subtitle: Text('Umur: ${Siswa.umur}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
