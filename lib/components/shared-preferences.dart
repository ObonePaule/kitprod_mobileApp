import 'package:shared_preferences/shared_preferences.dart';

setCurrentExploitationId(String idExploitation) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("idExploitation", idExploitation);
}

Future<String> getCurrentExploitationId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String idExploitation = prefs.getString("idExploitation")!;
  return idExploitation;
}
