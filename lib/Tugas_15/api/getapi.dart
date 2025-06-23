import 'dart:convert';

import 'package:bayuppkd_b_2/Tugas_15/database_15/sharedpreference.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/edit_error.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/edit_profile.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/get_profile.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/login_error.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/login_model.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/login_null.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/profile_null.dart';
import 'package:bayuppkd_b_2/Tugas_15/models/register_already.dart';
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
      return registErrorFromJson(response.body).toJson();
    } else if (response.statusCode == 422) {
      return registAlreadyFromJson(response.body).toJson();
    } else {
      throw Exception('Gagal Mendaftar Akun ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> loginUser(
    String name,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("https://absen.quidi.id/api/login"),
      headers: {'Accept': 'application/json'},
      body: {'name': name, 'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return loginResponseFromJson(response.body).toJson();
    } else if (response.statusCode == 401) {
      return loginErrorFromJson(response.body).toJson();
    } else if (response.statusCode == 404) {
      return loginNullFromJson(response.body).toJson();
    } else if (response.statusCode == 422) {
      return loginErrorFromJson(response.body).toJson(); // tambahkan ini
    } else {
      throw Exception('Gagal Menemukan Akun ${response.statusCode}');
    }
  }

  Future<DataProfile> profileUser() async {
    final token = await SharedPrefService.getToken();

    if (token == null) {
      throw Exception('Token tidak di temukan. Login terlebih dahulu');
    }

    final response = await http.get(
      Uri.parse('https://absen.quidi.id/api/profile'),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final getprofile = GetProfile.fromJson(jsonResponse);
      return getprofile.data!;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Map<String, dynamic>> editUser(String name, String email) async {
    final token = await SharedPrefService.getToken();

    if (token == null) {
      throw Exception('Token tidak di temukan. Login terlebih dahulu');
    }
    final response = await http.put(
      Uri.parse("https://absen.quidi.id/api/profile"),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
      body: {'name': name, 'email': email},
    );

    if (response.statusCode == 200) {
      return editProfileFromJson(response.body).toJson();
    } else if (response.statusCode == 401) {
      return editErrorFromJson(response.body).toJson();
    } else if (response.statusCode == 422) {
      return editErrorFromJson(response.body).toJson();
    } else {
      throw Exception('Gagal Menemukan Akun ${response.statusCode}');
    }
  }
}
