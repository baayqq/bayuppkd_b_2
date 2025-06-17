import 'package:bayuppkd_b_2/Tugas_14/model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<DataApi>> fetchUsers() async {
  final response = await http.get(
    Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> userData = jsonDecode(response.body);
    return userData.map((user) => DataApi.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
