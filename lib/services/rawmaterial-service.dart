import 'dart:convert';
import 'package:kitprod/components/shared-preferences.dart';
import 'package:kitprod/models/rawMaterial.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String host = dotenv.env['API_URL']!;
final String path = '/rawmaterials';

Future<List<RawMaterial>> getRawMaterialList(String idFood) async {
  String idExploitation = await getCurrentExploitationId();
  var params = {'idExploitation': idExploitation, 'idFood': idFood};
  var response = await http.get(Uri.https(host, path, params));
  Iterable rawmaterialsJson = jsonDecode(response.body);
  List<RawMaterial> rawmaterials = List<RawMaterial>.from(
      rawmaterialsJson.map((modelAsJson) => RawMaterial.fromJson(modelAsJson)));

  return rawmaterials;
}

Future<RawMaterial?> insertRawMaterial(String idFood, String body) async {
  String idExploitation = await getCurrentExploitationId();
  var params = {'idExploitation': idExploitation, 'idFood': idFood};
  var response = await http.post(Uri.https(host, path, params),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
  if (response.statusCode == 200) {
    return RawMaterial.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}
