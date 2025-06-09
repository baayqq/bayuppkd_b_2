import 'package:bayuppkd_b_2/helper/preference.dart';
import 'package:bayuppkd_b_2/meet_16/DataBase/Db_Helper.dart';
import 'package:bayuppkd_b_2/meet_16/register_screen.dart';
import 'package:bayuppkd_b_2/meet_2/meet2_2.dart';
import 'package:bayuppkd_b_2/meet_2/meet_2.dart';
import 'package:bayuppkd_b_2/meet_3/tugas_3a.dart';
import 'package:bayuppkd_b_2/meet_4/tugas_4.dart';
import 'package:bayuppkd_b_2/meet_5/tugas5.dart';
import 'package:flutter/material.dart';

class LoginSreenAPP extends StatefulWidget {
  static const String id = '/login_screen';

  const LoginSreenAPP({super.key});

  @override
  State<LoginSreenAPP> createState() => _LoginScreenAPPState();
}

class _LoginScreenAPPState extends State<LoginSreenAPP> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //hilangin overfloow saat onsreen keyboard
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //navigator pop
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),

        //actions: [Icon(Icons.arrow_back_ios_new),],
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff00224F),
      ),

      backgroundColor: Color(0xff00224F),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 60),
              Column(
                children: [
                  Text(
                    "Hello Welcome Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome back please \n sign in again",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
              SizedBox(height: 110),
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
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xffC4C4C4),
                              ),
                              hintText: ("Email"),
                              hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x30c4c4c4),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x30c4c4c4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            obscuringCharacter:
                                "*", // mengubah karakter untuk menyembunyikan pasword
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xffC4C4C4),
                              ),
                              // suffixIcon: IconButton(
                              //   onPressed: () {},
                              //   //icon: Icon(Icons.remove_red_eye),
                              // ),
                              hintText: ("Password"),
                              hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x30c4c4c4),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x30c4c4c4),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final userData = await DbHelper.login(
                    emailController.text,
                    passwordController.text,
                  );
                  if (userData != null) {
                    print('data ada ${userData.toJson()}');
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Login Berhasil')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('invalid email or password')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: (Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 16),
                ),

                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 70),
              Row(
                children: [
                  Expanded(child: Divider(color: Color(0x40C4C4C4))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "or",
                      style: TextStyle(color: Color(0xffFFFFFF)),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0x40C4C4C4))),
                ],
              ),

              SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff11325C),
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 16,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/fb.png"),
                        SizedBox(width: 8),
                        Text(
                          "Facebook",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff11325C),
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google.png"),
                        SizedBox(width: 8),
                        Text(
                          "Gmail",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(fontSize: 14, color: Color(0xff888888)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreenAPP(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
