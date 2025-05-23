import 'package:flutter/material.dart';

class TugasLima extends StatefulWidget {
  const TugasLima({super.key});

  @override
  State<TugasLima> createState() => _TugasLimaState();
}

class _TugasLimaState extends State<TugasLima> {
  bool _liatNama = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pusing"), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 87, 194, 190),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _liatNama = !_liatNama;
                    });
                  },
                  child: Text(_liatNama ? "sembunyikan" : "Tampilkan"),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          if (_liatNama) Text("nama saya bayu"),
        ],
      ),
    );
  }
}
