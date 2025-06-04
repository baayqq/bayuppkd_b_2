import 'package:bayuppkd_b_2/Tugas_11/Model11.dart';
import 'package:flutter/material.dart';
import 'package:bayuppkd_b_2/Tugas_11/DB_Helper11.dart';

class TugasSebelas extends StatefulWidget {
  const TugasSebelas({super.key});

  @override
  State<TugasSebelas> createState() => _TugasSebelasState();
}

class _TugasSebelasState extends State<TugasSebelas> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tiketController = TextEditingController();
  final TextEditingController asalController = TextEditingController();

  List<Pengunjung> daftarPengunjung = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DBHelperSebelas.getAllPengunjung();
    setState(() {
      daftarPengunjung = data;
    });
  }

  Future<void> simpanData() async {
    final nama = namaController.text;
    final email = emailController.text;
    final tiket = int.tryParse(tiketController.text) ?? 0;
    final asal = asalController.text;

    if (nama.isNotEmpty && tiket > 0) {
      await DBHelperSebelas.insertPengunjung(
        Pengunjung(nama: nama, email: email, tiket: tiket, asal: asal),
      );
      namaController.clear();
      emailController.clear();
      tiketController.clear();
      asalController.clear();
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
              controller: emailController,
              decoration: InputDecoration(labelText: 'email'),
            ),
            TextField(
              controller: tiketController,
              decoration: InputDecoration(labelText: 'Jumlah Tiket'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: asalController,
              decoration: InputDecoration(labelText: 'Kota'),
            ),
            SizedBox(height: 36),
            ElevatedButton(onPressed: simpanData, child: Text('Simpan')),
            Divider(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: daftarPengunjung.length,
                itemBuilder: (context, index) {
                  final Pengunjung = daftarPengunjung[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${Pengunjung.id}')),
                    title: Text(Pengunjung.nama),
                    subtitle: Text(
                      'Email: ${Pengunjung.email}\nTiket: ${Pengunjung.tiket}\nAsal: ${Pengunjung.asal}',
                    ),
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
