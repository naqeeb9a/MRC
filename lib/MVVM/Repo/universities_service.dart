import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mrc/MVVM/Model/universities_model.dart';
import 'package:mrc/MVVM/Repo/api_status.dart';

import '../../utils/utils.dart';

class UniversititesService {
  static Future<Object> getUniversitites() async {
    try {
      var url = Uri.parse("$baseUrl/api/universities");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(
            response.statusCode, universitiesInfoModelFromJson(response.body));
      }
      return Failure(response.statusCode, jsonDecode(response.body));
    } on HttpException {
      return Failure(101, "No internet");
    } on FormatException {
      return Failure(102, "Invalid format");
    } catch (e) {
      return Failure(103, "Unknown Error");
    }
  }
}
