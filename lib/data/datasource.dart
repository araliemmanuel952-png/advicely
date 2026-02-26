import 'dart:convert';

import 'package:advicely/data/model.dart';
import 'package:http/http.dart' as http;

Future<Conseil> genererConseil() async {
  final client = http.Client();
  final uri = "https://api.api-ninjas.com/v1/advice";
  final cle = "";
  final reponse = await client.get(Uri.parse(uri), headers: {"X-Api-Key": cle});
  final json =
      jsonDecode(utf8.decode(reponse.bodyBytes))
          as Map; // L'api ne retourne une liste dans ce cas présent.
  return Conseil.fromJSON(json);
}
