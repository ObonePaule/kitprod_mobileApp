import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kitprod/components/shared-preferences.dart';
import 'package:kitprod/models/building.dart';

final String host = dotenv.env['API_URL']!;
final String path = '/buildings';

Future<List<Building>> getBuildingList() async {
  String idExploitation = await getCurrentExploitationId();
  var params = {
    'idExploitation': idExploitation,
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable buildingsJson = jsonDecode(response.body);
  List<Building> buildings = List<Building>.from(
      buildingsJson.map((modelAsJson) => Building.fromJson(modelAsJson)));

  return buildings;
}

Future<Building?> insertBuilding(String body) async {
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
    return Building.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}
