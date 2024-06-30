import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Map<String, dynamic>>> realApiRequest(String data) async {
    var url = Uri.parse(
        "http://192.168.1.105:5000/palindrome"); // url test cihaınadüzenlenmelidir

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: data,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.cast<Map<String, dynamic>>();
      } else {
        log('status code: ' + response.statusCode.toString());
        return [];
      }
    } catch (error) {
      log('error: ' + error.toString());
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> fakeApiRequest(String data) async {
    log('fakeapi request');

    final response = fakeApi(data);

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.cast<Map<String, dynamic>>();
    } else {
      return [];
    }
  }

  http.Response fakeApi(String data) {
    List<String> strings = List<String>.from(json.decode(data));

    List<Map<String, dynamic>> response = [];

    for (String text in strings) {
      bool isPurePalindrome =
          text == String.fromCharCodes(text.runes.toList().reversed);

      String cleanedText =
          text.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();
      bool isPalindrome = cleanedText ==
          String.fromCharCodes(cleanedText.runes.toList().reversed);

      response.add({
        'text': text,
        'is_pure_palindrome': isPurePalindrome,
        'is_palindrome': isPalindrome,
      });
    }
    log(json.encode(response));
    return http.Response(json.encode(response), 200);
  }
}
