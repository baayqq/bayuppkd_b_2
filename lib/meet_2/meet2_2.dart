import 'package:flutter/material.dart';

class mTugaasDua extends StatelessWidget {
  mTugaasDua({super.key});

  String deskripsi =
      "There are many variations of passages of Lorem Ipsum available .0ghtly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";
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
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "BAYU",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black45),
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(12)),
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
            padding: EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black45),
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  Icon(Icons.phone),
                  Spacer(),
                  Text("+62 8241 1224 254"),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xffd5ede4),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text("Postingan  4"),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xff9e9898),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text("Followers  86.548"),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Padding(padding: EdgeInsets.all(16), child: Text(deskripsi)),
          ),
          SizedBox(height: 32),

          Expanded(child: Container(color: Colors.green)),
        ],
      ),
    );
  }
}
