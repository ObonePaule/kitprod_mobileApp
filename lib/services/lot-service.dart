import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kitprod/models/lot.dart';

final String host = 'c5e60931c6cf.ngrok.io';
final String path = '/lots';

Future<List<Lot>> getLotList(double idExploitation, double idBuilding) async {
  var params = {
    'idExploitation': idExploitation.toString(),
    'idBuilding': idBuilding.toString()
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable lotsJson = jsonDecode(response.body);
  List<Lot> lots =
      List<Lot>.from(lotsJson.map((modelAsJson) => Lot.fromJson(modelAsJson)));

  return lots;
}

Future<Lot?> insertLot(
    double idExploitation, double idBuilding, String body) async {
  var params = {
    'idExploitation': idExploitation.toString(),
    'idBuilding': idBuilding.toString()
  };
  var response = await http.post(Uri.https(host, path, params),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

  if (response.statusCode == 200) {
    return Lot.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}
