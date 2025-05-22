//import 'dart:ffi';

import 'package:flutter/material.dart';

class TugasEmpat extends StatefulWidget {
  TugasEmpat({super.key});

  @override
  State<TugasEmpat> createState() => _TugasEmpatState();
}

class _TugasEmpatState extends State<TugasEmpat> {
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerTelp = TextEditingController();
  TextEditingController _controllerDeskripsi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir Data"),
        backgroundColor: Color(0xff03A791),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(22),
            //margin: EdgeInsets.all(0),
            //color: Color(0xff81E7AF),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _controllerNama,
                  onChanged: (value) {
                    setState(() {
                      _controllerNama.text = value;
                    });
                  },

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.people_alt_rounded),
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
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _controllerEmail,
                  onChanged: (value) {
                    setState(() {
                      _controllerEmail.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "email",
                    prefixIcon: Icon(Icons.email),
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
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "Nomor Telp",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _controllerTelp,
                  onChanged: (value) {
                    setState(() {
                      _controllerTelp.text = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
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
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "Deskripsi",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _controllerDeskripsi,
                  onChanged: (value) {
                    setState(() {
                      _controllerDeskripsi.text = value;
                    });
                  },
                  maxLines: 2,
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
          //SizedBox(height: 18),
          // Container(
          //   height: 110,
          //   width: double.infinity,
          //   color: Color(0xff81E7AF),
          //   child: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text('Nama: ${_controllerNama.text}'),
          //         Text('Email: ${_controllerEmail.text}'),
          //         Text('Nomor: ${_controllerTelp.text}'),
          //         Text('Deskripsi: ${_controllerDeskripsi.text}'),
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product Info",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset("assets/images/ayam.jpg"),
                    shape: CircleBorder(),
                    title: Text("patrik"),
                    subtitle: Text("1.254.000"),
                    trailing: Icon(Icons.add_shopping_cart_sharp),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset("assets/images/topoki.jpg"),
                    shape: CircleBorder(),
                    title: Text("patrik"),
                    subtitle: Text("1.254.000"),
                    trailing: Icon(Icons.add_shopping_cart_sharp),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset("assets/images/salmon.jpg"),
                    shape: CircleBorder(),
                    title: Text("patrik"),
                    subtitle: Text("1.254.000"),
                    trailing: Icon(Icons.add_shopping_cart_sharp),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset("assets/images/burger.jpg"),
                    shape: CircleBorder(),
                    title: Text("patrik"),
                    subtitle: Text("1.254.000"),
                    trailing: Icon(Icons.add_shopping_cart_sharp),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset("assets/images/susi.jpg"),
                    shape: CircleBorder(),
                    title: Text("patrik"),
                    subtitle: Text("1.254.000"),
                    trailing: Icon(Icons.add_shopping_cart_sharp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
