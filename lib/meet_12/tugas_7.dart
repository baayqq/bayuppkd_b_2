import 'package:flutter/material.dart';
import 'package:bayuppkd_b_2/constant/app_color.dart';
import 'package:bayuppkd_b_2/constant/app_style.dart';
import 'package:bayuppkd_b_2/constant/app_style.dart';

class TugasTujuh extends StatefulWidget {
  const TugasTujuh({super.key});

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

class _TugasTujuhState extends State<TugasTujuh> {
  bool _cekBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tugas 7",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              // fillColor: WidgetStateProperty.all(AppColor.army1),
              activeColor: AppColor.army2,
              checkColor: Colors.white,
              shape: CircleBorder(),
              side: BorderSide(color: AppColor.army2, width: 0),
              value: _cekBox,
              onChanged: (value) {
                setState(() {
                  print("Checkbox value changed: $value");
                  _cekBox = value ?? false;
                });
              },
            ),
            Text(
              _cekBox ? "Sudah bagus" : "Belum bagus",
              style: AppStyle.fontBold(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
