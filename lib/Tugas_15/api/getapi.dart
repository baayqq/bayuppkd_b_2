import 'package:bayuppkd_b_2/Tugas_15/models/login_model.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/register_error.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/register_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<Map<String, dynamic>> registUser(
    String name,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("https://absen.quidi.id/api/register"),
      headers: {'Accept': 'application/json'},
      body: {'name': name, 'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return registerResponseFromJson(response.body).toJson();
    } else if (response.statusCode == 422) {
      return registerErrorFromJson(response.body).toJson();
    } else {
      throw Exception('Gagal Mendaftar Akun ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> loginUser(String name,String email, String password) async {
    final response = await http.post(
      Uri.parse("https://absen.quidi.id/api/login"),
      headers: {'Accept': 'application/json'},
      body: {'name': name,'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return loginResponseFromJson(response.body).toJson();
    } else if (response.statusCode == 422) {
      return loginResponseFromJson(response.body).toJson();
    } else {
      throw Exception('Gagal Menemukan Akun ${response.statusCode}');
    }
  }
}
