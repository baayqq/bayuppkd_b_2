import 'package:bayuppkd_b_2/Tugas_15/api/getapi.dart';
import 'package:bayuppkd_b_2/Tugas_15/auth/login.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/get_profile.dart';
import 'package:flutter/material.dart';

class ProfileLimaBelas extends StatefulWidget {
  const ProfileLimaBelas({super.key});

  @override
  State<ProfileLimaBelas> createState() => _ProfileLimaBelasState();
}

class _ProfileLimaBelasState extends State<ProfileLimaBelas> {
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile pengguna',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: Column(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: ListTile(
                        onTap: () {},
                        leading: CircleAvatar(child: Text('${profile.id}')),
                        title: Text('${profile.name}'),
                        subtitle: Text('${profile.email}'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
