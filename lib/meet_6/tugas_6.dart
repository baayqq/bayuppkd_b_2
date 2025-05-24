import 'package:flutter/material.dart';

class TugasEnam extends StatefulWidget {
  const TugasEnam({super.key});

  @override
  State<TugasEnam> createState() => _TugasEnamState();
}

class _TugasEnamState extends State<TugasEnam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
        //actions: [Icon(Icons.arrow_back_ios_new),],
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff00224F),
      ),

      backgroundColor: Color(0xff00224F),
      body: Column(
        children: [
          SizedBox(height: 60),
          Column(
            children: [
              Text(
                "Hello Welcome Back",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "Welcome back please \n sign in again",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white60),
              ),
            ],
          ),
          SizedBox(height: 120),
          Row(
            children: [
              Expanded(
                // width: 20,
                // height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xffFFFFFF),
                          ),
                          hintText: ("email"),
                          hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC4C4C4)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xffFFFFFF),
                          ),
                          hintText: ("paswword"),
                          hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffC4C4C4)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: (Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 110, vertical: 16),
            ),

            child: Text(
              "Login",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          SizedBox(height: 50),
          Text("or", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
