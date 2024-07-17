import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kitprod/components/shared-preferences.dart';
import 'package:kitprod/models/food.dart';

final String host = dotenv.env['API_URL']!;
final String path = '/foods';

Future<List<Food>> getFoodList() async {
  String idExploitation = await getCurrentExploitationId();
  var params = {
    'idExploitation': idExploitation,
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable foodsJson = jsonDecode(response.body);
  List<Food> foods = List<Food>.from(
      foodsJson.map((modelAsJson) => Food.fromJson(modelAsJson)));

  return foods;
}

Future<List<String>> getFoods() async {
  List<Food> foods = await getFoodList();
  List<String> foodStrings = List<String>.from(foods.map((food) => food.name));
  return foodStrings;
}

Future<Food?> insertFood(String body) async {
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

  var insertedFood = Food.fromJson(json.decode(response.body));
  if (response.statusCode == 200) {
    return insertedFood;
  } else {
    return null;
  }
}
