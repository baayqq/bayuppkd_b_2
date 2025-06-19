import 'package:flutter/material.dart';

class LoginLimaBelas extends StatelessWidget {
  const LoginLimaBelas({super.key});

  @override
  Widget build(BuildContext context) {
     final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();
  final TextEditingController _asalController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selamat datang\nSilahkan login terlebih dahulu',
              // textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
