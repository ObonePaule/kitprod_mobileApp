import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kitprod/components/user.dart';

final String host = dotenv.env['API_URL']!;
final String path = '/users';

Future<AppUser?> insertUser(String body) async {
  var response = await http.post(Uri.https(host, path), body: body, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
  if (response.statusCode == 200) {
    return AppUser.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}
