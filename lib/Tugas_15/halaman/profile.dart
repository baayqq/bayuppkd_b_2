import 'package:bayuppkd_b_2/Tugas_15/api/getapi.dart';
import 'package:bayuppkd_b_2/Tugas_15/auth/login.dart';
import 'package:bayuppkd_b_2/Tugas_15/database_15/sharedpreference.dart';
import 'package:bayuppkd_b_2/Tugas_15/halaman/home_!5.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/edit_profile.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/get_profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileLimaBelas extends StatefulWidget {
  const ProfileLimaBelas({super.key});

  @override
  State<ProfileLimaBelas> createState() => _ProfileLimaBelasState();
}

class _ProfileLimaBelasState extends State<ProfileLimaBelas> {
  String formatWaktu(DateTime waktu) {
    return DateFormat('d MMMM y, HH:mm').format(waktu);
  }

  List<Data> daftarProduct = [];
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final UserService userService = UserService();
  final _formKey = GlobalKey<FormState>();

  void _handleEdit() async {
    if (_formKey.currentState!.validate()) {
      final res = await userService.editUser(
        userController.text,
        emailController.text,
      );
      print("Respon dari API: $res"); // Debug log
      if (res['data'] != null) {
        Navigator.pop(context);
        setState(() {});

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('login berhasil'),
            backgroundColor: Colors.green,
          ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile pengguna',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: Colors.white70,
      ),
      drawer: Drawer(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.yellow, Colors.white70],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(12),
            children: [
              FutureBuilder<DataProfile>(
                future: userService.profileUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Terjadi Kesalahan: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData) {
                    return Center(child: Text('Tidak ada data profile'));
                  }

                  final profile = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        CircleAvatar(radius: 60, child: Text('${profile.id}')),
                        SizedBox(height: 16),
                        Text('${profile.name}'),
                        ListTile(
                          leading: Icon(Icons.home),
                          title: Text('Beranda'),
                          onTap: () {
                            setState(() {});
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DrawerHome(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.manage_accounts_sharp),
                          title: Text('Profile'),
                          onTap: () {
                            setState(() {});
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileLimaBelas(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 4),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginLimaBelas(),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white70, Colors.yellow],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<DataProfile>(
                future: userService.profileUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Terjadi Kesalahan: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData) {
                    return Center(child: Text('Tidak ada data profile'));
                  }

                  final profile = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle_rounded, size: 120),
                        SizedBox(height: 12),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 76),
                            ),
                            Text(
                              '${profile.name}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                profile.name = userController.text;
                                profile.email = emailController.text;

                                showDialog(
                                  context: context,
                                  builder:
                                      (context) => AlertDialog(
                                        title: Text('Edit Nama'),
                                        content: Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextFormField(
                                                controller: userController,
                                                decoration: InputDecoration(
                                                  labelText: 'Edit nama',
                                                ),
                                                validator:
                                                    (value) =>
                                                        value == null ||
                                                                value.isEmpty
                                                            ? 'Nama tidak boleh kosong'
                                                            : null,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed:
                                                () => Navigator.pop(context),
                                            child: Text('Batal'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                final res = await userService
                                                    .editUser(
                                                      userController.text,
                                                      emailController.text,
                                                    );

                                                if (res['data'] != null) {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              ProfileLimaBelas(),
                                                    ),
                                                  );
                                                  setState(() {});
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Berhasil mengedit profil',
                                                      ),
                                                      backgroundColor:
                                                          Colors.green,
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Gagal: ${res['message']}',
                                                      ),
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                            child: Text('Simpan'),
                                          ),
                                        ],
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text('${profile.email}'),
                        Text(
                          'Daftar pada : ${formatWaktu(profile.createdAt ?? DateTime.now())}',
                        ),
                        Text(
                          'DI edit pada : ${formatWaktu(profile.updatedAt ?? DateTime.now())}',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
