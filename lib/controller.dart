// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:tugas_mobile_api/model/Json.dart';

// Future<Test> getATest() async {
//   final response = await http.get(
//     Uri.parse('https://jsonplaceholder.typicode.com/todos'),
//   );

//   if (response.statusCode == 200) {
//     final Map<String, dynamic> data = json.decode(response.body);
//     print(data);
//     return Test.fromJson(data);
//   } else {
//     throw Exception('Failed to fetch test data');
//   }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugas_mobile_api/model/Json.dart';

Future<List<Test>> getTests() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    final List<Test> tests = data.map((json) => Test.fromJson(json)).toList();
    return tests;
  } else {
    throw Exception('Failed to fetch test data');
  }
}
