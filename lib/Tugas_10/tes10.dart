// import 'package:bayuppkd_b_2/Tugas_10/tesb10.dart';
// import 'package:flutter/material.dart';

// class Meet14b extends StatefulWidget {
//   const Meet14b({super.key});

//   @override
//   State<Meet14b> createState() => _Meet14bState();
// }

// class _Meet14bState extends State<Meet14b> {
//   final TextEditingController _emailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: "Email"),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Email tidak boleh kosong";
//                 } else if (!value.contains("@")) {
//                   return "Email tidak valid";
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 12),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   print("Berhasil");
//                   dialogSuccess(context);
//                 }
//               },
//               child: Text('daftar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<dynamic> dialogSuccess(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Berhasil"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [Text("Email anda : ${_emailController.text}")],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text("Tutup"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder:
//                         (context) =>
//                             HalamanTerimakasih(nama: _namaController.text),
//                   ),
//                 );
//               },
//               child: Text("Lanjut"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
