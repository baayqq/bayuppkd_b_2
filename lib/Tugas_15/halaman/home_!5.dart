import 'package:bayuppkd_b_2/Tugas_15/api/getapi.dart';
import 'package:bayuppkd_b_2/Tugas_15/auth/login.dart';
import 'package:bayuppkd_b_2/Tugas_15/halaman/profile.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/get_profile.dart';
import 'package:flutter/material.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({super.key});

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  final UserService userService = UserService();
  int _selectedIndex = 0;
  List<Widget> listScreen = [ProfileLimaBelas()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instogram',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      drawer: Drawer(
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
                        leading: Icon(Icons.manage_accounts_sharp),
                        title: Text('Profile'),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
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
      body: Column(children: [Text('selamat datang')]),
    );
  }
}
