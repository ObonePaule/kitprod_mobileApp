import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kitprod/components/shared-preferences.dart';
import 'dart:convert';

import 'package:kitprod/models/fixedTask.dart';

final String host = dotenv.env['API_URL']!;
final String path = '/fixedtasks';

Future<List<FixedTask>> getTasks() async {
  String idExploitation = await getCurrentExploitationId();
  var params = {
    'idExploitation': idExploitation.toString(),
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable tasksJson = jsonDecode(response.body);
  List<FixedTask> tasks =
      List<FixedTask>.from(tasksJson.map((i) => FixedTask.fromJson(i)));

  return tasks;
}

Future insertTask(String body) async {
  String idExploitation = await getCurrentExploitationId();
  var params = {
    'idExploitation': idExploitation.toString(),
  };
  var response = await http.post(Uri.https(host, path, params),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((i) => FixedTask.fromJson(i))
        .toList();
  } else {
    return null;
  }
}
