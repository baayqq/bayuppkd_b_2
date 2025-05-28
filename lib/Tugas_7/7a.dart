import 'package:flutter/material.dart';
import 'package:bayuppkd_b_2/constant/app_color.dart';
import 'package:bayuppkd_b_2/constant/app_style.dart';

class TujuhA extends StatefulWidget {
  const TujuhA({super.key});

  @override
  State<TujuhA> createState() => _TujuhAState();
}

class _TujuhAState extends State<TujuhA> {
  bool _cekBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "It's difficult to find examples of lorem ipsum in use before Letraset made it popular as a dummy text in the 1960s, although McClintock says he remembers coming across the lorem ipsum passage in a book of old metal type samples. So far he hasn't relocated where he once saw the passage, but the popularity of Cicero in the 15th century supports the theory that the filler text has been used for centuries.",
              ),
            ),
            Checkbox(
              //nomor 1
              // fillColor: WidgetStateProperty.all(AppColor.army1),
              activeColor: Colors.black,

              //shape: CircleBorder(),
              side: BorderSide(color: Colors.black),
              hoverColor: Colors.black,
              value: _cekBox,
              onChanged: (value) {
                setState(() {
                  print("Checkbox value changed: $value");
                  _cekBox = value ?? false;
                });
              },
            ),
            Text(
              _cekBox
                  ? "Anda Menyetujui Persyaratan"
                  : "Belum Menyutujui Persyaratan",
              style: AppStyle.fontBold(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
