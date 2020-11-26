import 'dart:convert';
import 'dart:async';

import 'package:bloc_pattern_network_fetch/model/api_model.dart';
import 'package:http/http.dart' as http;

class PlayerApiProvider {
  final String baseUrl =
      "https://www.easports.com/fifa/ultimate-team/api/fut/item?";

  final successCode = 200;

  Future<List<Player>> fetchPlayersByCountry(String countryId) async {
    final response = await http.get(baseUrl + "country=" + countryId);

    return parseResponse(response);
  }

  Future<List<Player>> fetchPlayersByName(String name) async {
    final response = await http.get(baseUrl + "namne=" + name);

    return parseResponse(response);
  }

  List<Player> parseResponse(http.Response response) {
    final responseString = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ApiResult.fromJson(responseString).items;
    }

    throw Exception('fail when load players');
  }
}
