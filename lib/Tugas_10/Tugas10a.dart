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
      // backgroundColor: Colors.tealAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'Terima Kasih $nama \nDari $asal \nTelah Sukses Mendaftar',
                    style: TextStyle(
                      fontSize: 40,
                      foreground:
                          Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.tealAccent[700]!,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // Solid text as fill.
                  Text(
                    'Terima Kasih $nama \nDari $asal \nTelah Sukses Mendaftar',
                    style: TextStyle(fontSize: 40, color: Colors.grey[300]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
