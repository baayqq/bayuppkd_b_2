import 'package:bayuppkd_b_2/Tugas_11/CancelOrder.dart';
import 'package:bayuppkd_b_2/Tugas_11/Model11.dart';
import 'package:flutter/material.dart';
import 'package:bayuppkd_b_2/Tugas_11/DB_Helper11.dart';

class TugasSebelas extends StatefulWidget {
  const TugasSebelas({super.key});

  @override
  State<TugasSebelas> createState() => _TugasSebelasState();
}

class _TugasSebelasState extends State<TugasSebelas> {
  final TextEditingController idController = TextEditingController();
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
    final id = int.tryParse(idController.text);
    final nama = namaController.text;
    final email = emailController.text;
    final tiket = int.tryParse(tiketController.text) ?? 0;
    final asal = asalController.text;

    if (nama.isNotEmpty && tiket > 0) {
      await DBHelperSebelas.insertPengunjung(
        Pengunjung(id: id, nama: nama, email: email, tiket: tiket, asal: asal),
      );
      idController.clear();
      namaController.clear();
      emailController.clear();
      tiketController.clear();
      asalController.clear();
      muatData();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loket Pembelian Tiket Bioskop',
          style: TextStyle(color: Color(0xffffffff)),
        ),
        backgroundColor: Color(0xff274d60),
      ),
      backgroundColor: Color(0xff6ba3be),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: 'Nama',
                filled: true,
                fillColor: Color(0xFFE6F0EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff789262), width: 1),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Film',
                filled: true,
                fillColor: Color(0xFFE6F0EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff789262), width: 1),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: tiketController,
              decoration: InputDecoration(
                labelText: 'Jumlah Tiket',
                filled: true,
                fillColor: Color(0xFFE6F0EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff789262), width: 1),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextField(
              controller: asalController,
              decoration: InputDecoration(
                labelText: 'Waktu',
                filled: true,
                fillColor: Color(0xFFE6F0EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff789262), width: 1),
                ),
              ),
            ),
            SizedBox(height: 36),
            ElevatedButton(onPressed: simpanData, child: Text('Simpan')),
            Divider(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: daftarPengunjung.length,
                itemBuilder: (context, index) {
                  final Pengunjung = daftarPengunjung[index];
                  return Card(
                    child: ListTile(
                      onTap: () {},
                      leading: CircleAvatar(child: Text('${index +1}')),
                      title: Text(Pengunjung.nama),
                      subtitle: Text(
                        'Film: ${Pengunjung.email}\nTiket: ${Pengunjung.tiket}\nWaktu: ${Pengunjung.asal}',
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => COrder()),
                );
                setState(() {
                  muatData();
                });
              },
              child: Text('Pembatalan Order'),
            ),
          ],
        ),
      ),
    );
  }
}
