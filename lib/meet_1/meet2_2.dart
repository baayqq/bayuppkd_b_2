import 'package:flutter/material.dart';

class mTugaasDua extends StatelessWidget {
  mTugaasDua({super.key});

  String deskripsi =
      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFIL LENGKAP"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/images/pat.jpg"),
            // child: Text(
            //   "Bayu Saputra",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            // ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              color: Colors.green,
            ),
            //margin: EdgeInsets.all(value),
            child: Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 8),
                Text("bayu@gmail.com"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.phone),
                Spacer(),
                Text("+62 8241 1224 254"),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 60,
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text("Postingan"),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 60,
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Text("Followers"),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Padding(padding: EdgeInsets.all(16), child: Text(deskripsi)),
          ),
        ],
      ),
    );
  }
}
