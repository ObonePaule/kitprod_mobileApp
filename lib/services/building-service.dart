import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kitprod/models/building.dart';

final String host = '92acb6e9061e.ngrok.io';
final String path = '/buildings';

Future<List<Building>> getBuildingList(double idExploitation) async {
  var params = {
    'idExploitation': idExploitation.toString(),
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable buildingsJson = jsonDecode(response.body);
  List<Building> buildings = List<Building>.from(
      buildingsJson.map((modelAsJson) => Building.fromJson(modelAsJson)));

  return buildings;
}

Future<int> insertBuilding(double idExploitation, String body) async {
  var params = {
    'idExploitation': idExploitation.toString(),
  };
  var response = await http.post(Uri.https(host, path, params),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
  //print(Building.fromJson(json.decode(response.body)));
  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    return 0;
  }
}
