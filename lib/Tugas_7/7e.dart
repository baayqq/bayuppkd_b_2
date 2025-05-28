import 'package:flutter/material.dart';

class TujuhE extends StatefulWidget {
  const TujuhE({super.key});

  @override
  State<TujuhE> createState() => _TujuhEState();
}

class _TujuhEState extends State<TujuhE> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
            Text(
              selectedTime == null
                  ? "Pilih Tanggal"
                  : "${selectedTime!.hour}.${selectedTime!.minute}",
            ),
          ],
        ),
      ),
    );
  }
}
