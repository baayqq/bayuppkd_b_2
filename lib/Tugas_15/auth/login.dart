import 'package:bayuppkd_b_2/Tugas_15/api/getapi.dart';
import 'package:bayuppkd_b_2/Tugas_15/auth/register.dart';
import 'package:bayuppkd_b_2/Tugas_15/halaman/profile.dart';
import 'package:bayuppkd_b_2/Tugas_15/halaman/home_!5.dart';
import 'package:flutter/material.dart';
import 'package:bayuppkd_b_2/Tugas_15/database_15/sharedpreference.dart';

class LoginLimaBelas extends StatelessWidget {
  const LoginLimaBelas({super.key});
  static const String id = '/login_screen_api';

  @override
  Widget build(BuildContext context) {
    final TextEditingController _userController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final UserService userService = UserService();
    final _formKey = GlobalKey<FormState>();

    void _handleLogin() async {
      if (_formKey.currentState!.validate()) {
        final res = await userService.loginUser(
          _userController.text,
          _emailController.text,
          _passwordController.text,
        );
        print("Respon dari API: $res"); // Debug log
        if (res['data'] != null) {
          final token = res['data']['token'];
          await SharedPrefService.saveToken(token);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('login berhasil'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DrawerHome()),
            (route) => false,
          );
        } else if (res['message'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('maaf ${res['message']}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.white70],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 120),
                Text(
                  'Selamat datang\nSilahkan login terlebih dahulu',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 80),
                TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                    hintText: "Nama",
                    hintStyle: TextStyle(color: Color(0xff333333)),
                    prefixIcon: Icon(Icons.people_alt_rounded),
                    filled: true,
                    fillColor: Color(0xFFE6F0EA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xff789262),
                        width: 1,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'nama wajib di isi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Color(0xff333333)),
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: Color(0xFFE6F0EA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xff789262),
                        width: 1,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'nama wajib di isi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color(0xff333333)),
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Color(0xFFE6F0EA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xff789262),
                        width: 1,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password wajib di isi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 36),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Berhasil');
                        _handleLogin();
                      }
                    },
                    child: Text('Login'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Belum mempunyai akun ?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff888888),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterLimaBelas(),
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
      ),
    );
  }
}
