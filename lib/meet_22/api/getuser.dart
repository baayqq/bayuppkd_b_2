import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bayuppkd_b_2/meet_22/model/usermodel.dart';

Future<List<UserData>> fetchUsers() async {
  final response = await http.get(
    Uri.parse('https://reqres.in/api/users?page=2'),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> userData = data['data'];
    return userData.map((user) => UserData.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
