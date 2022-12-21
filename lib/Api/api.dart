import 'package:http/http.dart' as http;

class Api {
  static String baseUrl = "https://mrc.devroom.live";
  static login({
    required String email,
    required String password,
  }) async {
    var response = await http.post(
        Uri.parse(
          "$baseUrl/api/login",
        ),
        body: {
          "email": email,
          "password": password,
        });

    return response;
  }

  static signUp({
    required String leadName,
    required String email,
    required String mobile,
    required String phone,
    required String dob,
    required String address,
    required String testName,
    required String qualification,
    required String workExperience,
    required String testScore,
    required String testDate,
    required List interestedIn,
    required String find,
    required String sponsor,
    required String sponsorProfession,
  }) async {
    var response = await http.post(Uri.parse("$baseUrl/api/signup"), body: {
      "lead_name": leadName,
      "email": email,
      "mobile": mobile,
      "phone": phone,
      "date_of_birth": dob,
      "address1": address,
      "test_name": testName,
      "qualification": qualification,
      "work_experience": workExperience,
      "test_date": testDate,
      "test_score": testScore,
      "interested_in": interestedIn.toString(),
      "find": find,
      "sponsor": sponsor,
      "sponsor_profession": sponsorProfession
    });
    return response;
  }

  static searchItem({String value = "", String country = ""}) async {
    var response = await http.get(
      Uri.parse("$baseUrl/api/universities?name=$value&country=$country"),
    );
    return response;
  }

  static getUniversities() async {
    var response = await http.get(
      Uri.parse("$baseUrl/api/universities"),
    );
    return response;
  }

  static applyForApp(
      String uniId, String courseId, String leadId, String userId) async {
    var response =
        await http.post(Uri.parse("$baseUrl/api/applications/$userId"), body: {
      "lead_id": leadId,
      "university_id": uniId,
      "course_id": courseId,
      "user_id": userId
    });

    return response;
  }

  static getUniApp() async {
    var response = await http.get(
      Uri.parse("$baseUrl/api/applications/16"),
    );

    return response;
  }

  static getProgress(String leadId) async {
    var response = await http.get(
      Uri.parse("$baseUrl/api/progress/$leadId"),
    );

    return response;
  }
}
