import 'package:flutter/material.dart';

class MeetDuaA extends StatelessWidget {
  const MeetDuaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Meet Dua A"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Action for search button
            },
          ),
        ],
      ),

      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Column(
              children: [
                Text("PPKD Mobile Programming B 2"),
                Spacer(),
                // SizedBox(height: 20),
                Text("PPKD Mobile Programming B 2"),
                Spacer(),
                Text("PPKD Mobile Programming B 2"),
                Spacer(),
                Row(children: [Text("PPKD "), Spacer(), Text("PPKD ")]),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: Column(
              children: [
                Container(height: 50, color: Colors.amber),
                Spacer(flex: 2),
                // SizedBox(height: 20),
                Container(height: 50, color: Colors.blue),

                Spacer(),
                Container(height: 50, color: Colors.black),

                Spacer(),
                Row(
                  children: [
                    Container(width: 50, height: 50, color: Colors.blue),
                    Spacer(),
                    Container(height: 50, width: 50, color: Colors.amber),
                    Spacer(),
                    Container(height: 50, width: 50, color: Colors.black),
                  ],
                ),
              ],
            ),
          ),
          Center(child: Text("data")),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/b/be/Joko_Widodo_2019_official_portrait.jpg",
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/images/jokowi.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
