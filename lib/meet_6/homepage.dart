import 'package:bayuppkd_b_2/meet_6/tugas_6.dart';
import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TugasEnam()),
                );
              },
              child: Text("push"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tugas5');
              },
              child: Text("push named"),
            ),
          ],
        ),
      ),
    );
  }
}
