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
  bool _lampu = false;
  String? isSelected;
  DateTime? selectDate;
  TimeOfDay? selectedTime;
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
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(leading: Icon(Icons.check_box), title: Text('Check Box')),
            ListTile(
              leading: Icon(Icons.dark_mode_outlined),
              title: Text('Switch'),
            ),
            ListTile(leading: Icon(Icons.list_sharp), title: Text('Drop Down')),
            ListTile(leading: Icon(Icons.date_range), title: Text('Tanggal')),
            ListTile(
              leading: Icon(Icons.access_time_outlined),
              title: Text('Jam'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              //nomor 1
              // fillColor: WidgetStateProperty.all(AppColor.army1),
              activeColor: AppColor.army2,
              checkColor: Colors.black,
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
            Row(
              children: [
                Switch(
                  // nomor 2
                  value: _lampu,
                  onChanged: (value) {
                    setState(() {
                      _lampu = value;
                    });
                  },
                ),
                Text(_lampu ? 'hidup' : 'mati'),
              ],
            ),
            Column(
              children: [
                DropdownButton<String>(
                  // nomor 3
                  value: isSelected,
                  hint: Text("pilih data"),
                  items:
                      ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((
                        String val,
                      ) {
                        return DropdownMenuItem(value: val, child: Text(val));
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      isSelected = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  // nomor 4
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() {
                        selectDate = picked;
                      });
                    }
                  },
                  child: Text('pilih tanggal'),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedTime = picked;
                      });
                    }
                  },
                  child: Text('pilih jam'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
