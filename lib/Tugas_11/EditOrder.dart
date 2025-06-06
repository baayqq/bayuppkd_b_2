import 'package:flutter/material.dart';
import 'DB_Helper11.dart';
import 'Model11.dart';

class EOrder extends StatefulWidget {
  final Pengunjung pengunjung;

  const EOrder({Key? key, required this.pengunjung}) : super(key: key);

  @override
  State<EOrder> createState() => _EOrderState();
}

class _EOrderState extends State<EOrder> {
  late TextEditingController namaController;
  late TextEditingController emailController;
  late TextEditingController tiketController;
  late TextEditingController asalController;

  String? isSelected;
  TimeOfDay? selectedTime;

  final List<String> _categories = [
    "Avenger Infinity War",
    "Jumbo",
    "Transformers Last Knight",
    "Final Destination 4",
  ];
  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.pengunjung.nama);
    emailController = TextEditingController(text: widget.pengunjung.email);
    tiketController = TextEditingController(
      text: widget.pengunjung.tiket.toString(),
    );
    asalController = TextEditingController(text: widget.pengunjung.asal);
  }

  void update() async {
    final updated = Pengunjung(
      id: widget.pengunjung.id,
      nama: namaController.text,
      email: emailController.text,
      tiket: int.tryParse(tiketController.text) ?? 0,
      asal: asalController.text,
    );

    await DBHelperSebelas.updatePengunjung(updated);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Pesanan', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff274d60),
      ),
      backgroundColor: Color(0xff6ba3be),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                hintText: 'Nama',
                filled: true,
                fillColor: Color(0xFFE6F0EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff789262), width: 1),
                ),
              ),
            ),
            SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: isSelected,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFE6F0EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff789262), width: 1),
                ),
              ),
              hint: Text("Pilih Film"),
              items:
                  _categories.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  isSelected = value!;
                  emailController.text = value; // Set nilai ke controller
                });
              },
            ),
            SizedBox(height: 8),

            TextField(
              controller: tiketController,
              decoration: InputDecoration(
                hintText: 'Tiket',
                filled: true,
                fillColor: Color(0xFFE6F0EA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff789262), width: 1),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),

            GestureDetector(
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    selectedTime = picked;
                    asalController.text = picked.format(context); // Format jam
                  });
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: asalController,
                  decoration: InputDecoration(
                    hintText: 'Waktu',
                    filled: true,
                    fillColor: Color(0xFFE6F0EA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xff789262),
                        width: 1,
                      ),
                    ),
                    suffixIcon: Icon(Icons.access_time),
                  ),
                  readOnly: true,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                update();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Berhasil Mengubah Pesanan"),
                    backgroundColor: Colors.teal,
                  ),
                );
              },
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
