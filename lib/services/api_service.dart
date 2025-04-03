import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/show_model.dart';

class ApiService {
  static const String baseUrl = "https://api.example.com";

  static Future<List<Show>> getShows() async {
    final response = await http.get(Uri.parse("$baseUrl/shows"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Show.fromJson(e)).toList();
    }
    return [];
  }

  static Future<void> updateShow(Show show) async {
    await http.put(Uri.parse("$baseUrl/shows/${show.id}"),
        body: show.toJson());
  }

  static Future<String?> login(String email, String password) async {
    final response = await http.post(Uri.parse("$baseUrl/login"),
        body: {"email": email, "password": password});
    return response.statusCode == 200 ? jsonDecode(response.body)["token"] : null;
  }
}
