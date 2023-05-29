import 'dart:convert';

import 'package:http/http.dart' as http;

import '../main.dart';

Future upload(String name) async {
  final url = Uri.parse('$URL/output_list');

  final body = {
    'file_name': name,
  };
  try {
    await http.post(url, body: body).then((response) {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return data;
      } else {}
    });
  } catch (e) {
    print('Error : ' + e.toString());
  }
}
