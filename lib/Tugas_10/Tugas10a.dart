import 'package:flutter/material.dart';

class HalamanTerimakasih extends StatelessWidget {
  const HalamanTerimakasih({
    super.key,
    required this.nama,
    required this.email,
    required this.nomor,
    required this.asal,
  });

  final String nama;
  final String email;
  final String nomor;
  final String asal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informasi Pengguna",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Terima Kasih $nama \nDari $asal \nTelah Sukses Mendaftar',
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
