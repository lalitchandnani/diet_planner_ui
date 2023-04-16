import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<Map<String, dynamic>> fetchDietRecommendations(String name, int age, int weight, int height) async {
    String url = "http://140.238.246.216:8000/get_diet_plan/";
    Map<String, String> headers = {
      "Content-Type": "application/json"
    };

    Map<String, dynamic> data = {
      "name": name,
      "age": age,
      "weight": weight,
      "height": height
    };

    String jsonBody = json.encode(data);

    try {
      print(jsonBody);
      http.Response response = await http.post(Uri.parse(url), headers: headers, body: jsonBody);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        String text = responseBody['diet_plan'];
        // do something with the response text
        print(text);
        return { "recommendation": text };
      } else {
        return { "recommendation": 'API call failed with status code ${response.statusCode}' };
      }
    } catch (e) {
      return { "recommendation": 'API call failed with error: $e' };
    }
  }
}
