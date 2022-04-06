import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/loot.dart';
import 'gamerpower_secrets.dart';

Future<List<Loot>> fetchLoot() async {
  String query = '?type=game&sort-by=popularity';

  final response = await http.get(
    Uri.parse(url + query),
    headers: headers,
  );

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception('Unexpected error occured!');
  }

  List jsonResponse = json.decode(response.body);
  return jsonResponse.map((loot) => Loot.fromJson(loot)).toList();
}
