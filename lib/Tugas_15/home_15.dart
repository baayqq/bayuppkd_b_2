import 'package:bayuppkd_b_2/Tugas_15/auth/login.dart';
import 'package:flutter/material.dart';

class HomeLimaBelas extends StatefulWidget {
  const HomeLimaBelas({super.key});

  @override
  State<HomeLimaBelas> createState() => _HomeLimaBelasState();
}

class _HomeLimaBelasState extends State<HomeLimaBelas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 40),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginLimaBelas()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: Column(children: []),
    );
  }
}
