import 'package:bayuppkd_b_2/Tugas_10/Tugas10a.dart';
import 'package:flutter/material.dart';

class TugasSepuluh extends StatefulWidget {
  const TugasSepuluh({super.key});

  @override
  State<TugasSepuluh> createState() => _TugasSepuluhState();
}

class _TugasSepuluhState extends State<TugasSepuluh> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();
  final TextEditingController _asalController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Future<dynamic> dialogSuccess(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Berhasil"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nama : ${_namaController.text}"),
              Text("Email anda : ${_emailController.text}"),
              Text("Nomor Telphone: ${_nomorController.text}"),
              Text("Domisili : ${_asalController.text}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Tutup"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => HalamanTerimakasih(
                          nama: _namaController.text,
                          email: _emailController.text,
                          nomor: _nomorController.text,
                          asal: _asalController.text,
                        ),
                  ),
                );
              },
              child: Text("Lanjut"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Formulir Pendaftaran",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'SILAHKAN ISI FORMULIR TERLEBIH DAHULU',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 8),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  hintText: "Nama",
                  hintStyle: TextStyle(color: Color(0xff333333)),
                  prefixIcon: Icon(Icons.people_alt_rounded),
                  filled: true,
                  fillColor: Color(0xFFE6F0EA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xff789262), width: 1),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'nama wajib di isi';
                  }
                  return null;
                },
              ),
              ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "email",
                  hintStyle: TextStyle(color: Color(0xff333333)),
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Color(0xFFE6F0EA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xff789262), width: 1),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email wajib di isi';
                  } else if (!value.contains("@")) {
                    return 'Format Email tidak valid';
                  }
                  return null;
                },
              ),
              ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 8),
              TextFormField(
                controller: _nomorController,
                decoration: InputDecoration(
                  hintText: "Nomor",
                  hintStyle: TextStyle(color: Color(0xff333333)),
                  prefixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Color(0xFFE6F0EA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xff789262), width: 1),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'nomor wajib di isi';
                  } else if (value.length < 10) {
                    return 'Format nomor tidak valid';
                  }
                  return null;
                },
              ),
              ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 8),
              TextFormField(
                controller: _asalController,
                decoration: InputDecoration(
                  hintText: "domisili",
                  hintStyle: TextStyle(color: Color(0xff333333)),
                  prefixIcon: Icon(Icons.maps_home_work_rounded),
                  filled: true,
                  fillColor: Color(0xFFE6F0EA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xff789262), width: 1),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'domisili wajib di isi';
                  }
                  return null;
                },
              ),
              ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Berhasil');
                    dialogSuccess(context);
                  }
                },
                child: Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
