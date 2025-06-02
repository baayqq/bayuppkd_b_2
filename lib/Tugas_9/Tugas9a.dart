import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TugasSembilanA extends StatefulWidget {
  const TugasSembilanA({super.key});

  @override
  State<TugasSembilanA> createState() => _TugasSembilanAState();
}

class _TugasSembilanAState extends State<TugasSembilanA> {
  final List<String> kategori = [
    'Buah-buahan',
    'Sayuran',
    'Elektronik',
    'Pakaian Pria',
    'Pakaian Wanita',
    'Alat Tulis Kantor',
    'Buku & Majalah',
    'Peralatan Dapur',
    'Makanan Ringan',
    'Minuman',
    'Mainan Anak',
    'Peralatan Olahraga',
    'Produk Kesehatan',
    'Kosmetik',
    'Obat-obatan',
    'Aksesoris Mobil',
    'Perabot Rumah',
    'Sepatu & Sandal',
    'Barang Bekas',
    'Voucher & Tiket',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tugas 9a",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff031716),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: kategori.length,
              itemBuilder: (BuildContext context, int index) {
                return Text("${index + 1} ${kategori[index]}");
              },
            ),
          ),
        ],
      ),
    );
  }
}
