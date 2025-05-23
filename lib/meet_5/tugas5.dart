import 'package:flutter/material.dart';

class TugasLimaTes extends StatefulWidget {
  const TugasLimaTes({super.key});

  @override
  State<TugasLimaTes> createState() => _TugasLimaTesState();
}

class _TugasLimaTesState extends State<TugasLimaTes> {
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
