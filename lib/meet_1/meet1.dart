import 'package:flutter/material.dart';

class meetSatu extends StatelessWidget {
  const meetSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent, // Changed color to indigoAccent
        title: Text("Pertemuan 1"), // Changed title to "Pertemuan 1"
        centerTitle: true, // Centered the title
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Action for search button
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pertemuan"),
            Text("Kelas : Mobile Progaming"),
            Text("Nama : Bayu"),
            //Row(children: [Text("gambar1"), Text("gambar2"), Text("gambar3")]),//row
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Pertemuan"),
          Text("Kelas : Mobile Progaming"),
          Text("Nama : Bayu"),
          //Row(children: [Text("gambar1"), Text("gambar2"), Text("gambar3")]),//row
        ],
      ),
    );
  }
}
