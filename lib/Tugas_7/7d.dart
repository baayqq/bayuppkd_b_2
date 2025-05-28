import 'package:flutter/material.dart';

class TujuhD extends StatefulWidget {
  const TujuhD({super.key});

  @override
  State<TujuhD> createState() => _TujuhDState();
}

class _TujuhDState extends State<TujuhD> {
  DateTime? selectDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              // nomor 4
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  //initialDate: DateTime.now(),
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
            Text(
              selectDate == null
                  ? "Pilih Tanggal"
                  : "${selectDate!.day}/${selectDate!.month}/${selectDate!.year}",
            ),
            // Text(DateTime.now().toString()),
            // Text(DateFormat.MMMMd().format(selectDate ?? DateTime.now())),
            // Text(AppFormat.createDateFullDay(selectDate ?? DateTime.now())),
          ],
        ),
      ),
    );
  }
}
