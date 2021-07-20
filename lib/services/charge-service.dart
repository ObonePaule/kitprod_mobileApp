import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kitprod/components/shared-preferences.dart';
import 'package:kitprod/models/charge.dart';

final String host = dotenv.env['API_URL']!;
final String path = '/charges';

Future<List<Charge>> getCharges() async {
  String idExploitation = await getCurrentExploitationId();
  var params = {
    'idExploitation': idExploitation,
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable chargesJson = jsonDecode(response.body);
  List<Charge> charges = List<Charge>.from(
      chargesJson.map((modelAsJson) => Charge.fromJson(modelAsJson)));

  return charges;
}

Future<List<Charge>?> insertCharges(String body) async {
  String idExploitation = await getCurrentExploitationId();
  var params = {
    'idExploitation': idExploitation,
  };
  var response = await http.post(Uri.https(host, path, params),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((i) => Charge.fromJson(i))
        .toList();
  } else {
    return null;
  }
}
