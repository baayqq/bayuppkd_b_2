import 'package:bayuppkd_b_2/meet_22/api/getuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ 
          FutureBuilder(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final users = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: users?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final user = users?[index];
                    return ListTile(
                      title: Text("${user?.firstName} ${user?.lastName}"),
                      subtitle: Text("${user?.email}"),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user?.avatar ?? ""),
                      ),
                    );
                  },
                );
              } else {
                return Text("Error: ${snapshot.error}");
              }
            },
          ),
        ],
      ),
    );
  }
}
