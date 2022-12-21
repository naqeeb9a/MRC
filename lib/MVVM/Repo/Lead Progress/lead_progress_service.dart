import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mrc/MVVM/Model/Lead%20Progress/lead_progress_model.dart';
import 'package:mrc/MVVM/Repo/api_status.dart';

import '../../../utils/utils.dart';

class LeadProgressService {
  static Future<Object> getProgress(String leadId) async {
    try {
      var url = Uri.parse("$baseUrl/api/progress/$leadId");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(
            response.statusCode, leadProgressFromJson(response.body));
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
