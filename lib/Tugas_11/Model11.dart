// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pengunjung {
  final int? id;
  final String nama;
  final String email;
  final int tiket;
  final String asal;

  Pengunjung({
    this.id,
    required this.nama,
    required this.email,
    required this.tiket,
    required this.asal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'email': email,
      'tiket': tiket,
      'asal': asal,
    };
  }

  factory Pengunjung.fromMap(Map<String, dynamic> map) {
    return Pengunjung(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      email: map['email'] as String,
      tiket: map['tiket'] as int,
      asal: map['asal'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pengunjung.fromJson(String source) =>
      Pengunjung.fromMap(json.decode(source) as Map<String, dynamic>);
}
