import 'package:http/http.dart' as http;
import 'package:kitprod/models/charge.dart';
import 'dart:convert';

final String host = '4432a3b40da2.ngrok.io';
final String path = '/charges';

Future<List<Charge>> getCharges(double idExploitation) async {
  var params = {
    'idExploitation': idExploitation.toString(),
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable chargesJson = jsonDecode(response.body);
  List<Charge> charges = List<Charge>.from(
      chargesJson.map((modelAsJson) => Charge.fromJson(modelAsJson)));

  return charges;
}

Future insertCharges(double idExploitation, String body) async {
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
    return "super";
  } else {
    return null;
  }
}
