import 'dart:ffi';

import 'package:flutter/material.dart';

class TugasTiga extends StatefulWidget {
  TugasTiga({super.key});

  @override
  State<TugasTiga> createState() => _TugasTigaState();
}

class _TugasTigaState extends State<TugasTiga> {
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerTelp = TextEditingController();
  TextEditingController _controllerDeskripsi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 3"),
        backgroundColor: Color(0x9003A791),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              // decoration: BoxDecoration(
              //   color: Color(0x6081E7AF),
              //   border: Border.all(color: Colors.black87),
              // ),
              padding: EdgeInsets.all(22),
              //margin: EdgeInsets.all(0),
              //color: Color(0x6081E7AF),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "nama",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: _controllerNama,
                    onChanged: (value) {
                      setState(() {
                        _controllerNama.text = value;
                      });
                    },

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.safety_divider),
                      hintText: "masukan nama",
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xffD2D0A0),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: _controllerEmail,
                    onChanged: (value) {
                      setState(() {
                        _controllerEmail.text = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "email",
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xffD2D0A0),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        "Nomor Telp",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: _controllerTelp,
                    onChanged: (value) {
                      setState(() {
                        _controllerTelp.text = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "No. HP",
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xffD2D0A0),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        "Deskripsi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: _controllerDeskripsi,
                    onChanged: (value) {
                      setState(() {
                        _controllerDeskripsi.text = value;
                      });
                    },
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "deskripsi",
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xffD2D0A0),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 110,
              width: double.infinity,
              color: Color(0x6081E7AF),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama: ${_controllerNama.text}'),
                    Text('Email: ${_controllerEmail.text}'),
                    Text('Nomor: ${_controllerTelp.text}'),
                    Text('Deskripsi: ${_controllerDeskripsi.text}'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Container(
                      color: Color(0x6081E7AF),
                      child: Stack(children: [Center(child: Text("nama"))]),
                    ),
                    Container(
                      color: Color(0x6081E7AF),
                      child: Stack(children: [Center(child: Text("nama"))]),
                    ),
                    Container(
                      color: Color(0x6081E7AF),
                      child: Stack(children: [Center(child: Text("nama"))]),
                    ),
                    Container(
                      color: Color(0x6081E7AF),
                      child: Stack(children: [Center(child: Text("nama"))]),
                    ),
                    Container(
                      color: Color(0x6081E7AF),
                      child: Stack(children: [Center(child: Text("nama"))]),
                    ),
                    Container(
                      color: Color(0x6081E7AF),
                      child: Stack(children: [Center(child: Text("nama"))]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
