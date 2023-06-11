import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos/'),
  );

  final data = json.decode(response.body);

  print(data);
}
