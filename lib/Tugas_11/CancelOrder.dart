import 'package:bayuppkd_b_2/Tugas_11/EditOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'DB_Helper11.dart';
import 'Model11.dart';
import 'package:fluttertoast/fluttertoast.dart';

class COrder extends StatefulWidget {
  const COrder({super.key});

  @override
  State<COrder> createState() => _COrderState();
}

class _COrderState extends State<COrder> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tiketController = TextEditingController();
  final TextEditingController asalController = TextEditingController();

  void showToast(String msg, {int? duration, int? gravity}) {}

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
      appBar: AppBar(
        title: Text('Info Pengunjung', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff274d60),
      ),
      backgroundColor: Color(0xff6ba3be),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: daftarPengunjung.length,
                itemBuilder: (context, index) {
                  final Pengunjung = daftarPengunjung[index];
                  return Card(
                    // color: Color(0xff6ba3be),
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(Pengunjung.nama),
                      subtitle: Text(
                        'Film: ${Pengunjung.email}\nTiket: ${Pengunjung.tiket}\nWaktu: ${Pengunjung.asal}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          EOrder(pengunjung: Pengunjung),
                                ),
                              );
                              setState(() {
                                muatData();
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: Text(
                                        'Apakah anda yakin ingin\nmembatalkan pesanan?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Batal"),
                                        ),

                                        TextButton(
                                          onPressed: () async {
                                            await DBHelperSebelas.deletePengunjung(
                                              Pengunjung.id!,
                                            );
                                            muatData();
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Berhasil Melakukan Pembatalan",
                                                ),
                                                backgroundColor: Colors.teal,
                                              ),
                                            );
                                          },
                                          child: Text("Lanjut"),
                                        ),
                                      ],
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
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
