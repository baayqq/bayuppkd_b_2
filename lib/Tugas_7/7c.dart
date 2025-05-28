import 'package:flutter/material.dart';

class TujuhC extends StatefulWidget {
  const TujuhC({super.key});

  @override
  State<TujuhC> createState() => _TujuhCState();
}

class _TujuhCState extends State<TujuhC> {
  String? isSelected;
  final List<String> _categories = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              //value: isSelected,
              hint: Text("pilih data"),
              items:
                  _categories
                      .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                      )
                      .toList(),
              onChanged: (val) {
                setState(() {
                  isSelected = val;
                });
              },
            ),
            Text(
              isSelected != null
                  ? "anda memilih $isSelected"
                  : "silahkan pilih kategor",
            ),
          ],
        ),
      ),
    );
  }
}
