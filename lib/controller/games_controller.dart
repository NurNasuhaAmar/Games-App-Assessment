import 'dart:convert';

import 'package:base_app/model/details.dart';
import 'package:base_app/model/games.dart';
import 'package:base_app/model/screenshots.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GamesController extends GetxController {
  dynamic context = Get.context;

  static GamesController getInstance = Get.isRegistered<GamesController>() ? Get.find<GamesController>() : Get.put(GamesController());

  String key = '6eaf82e6cd264cbd9ea5950dd863e5dc';

  bool isLoadingLatestGames = false;
  bool isLoadingGameDetail = false;

  List<Games> listGames = [];
  List<Screenshots> listScreenshots = [];

  GameDetails details = GameDetails();

  Future<List<Games>?> getLatestGames() async {
    isLoadingLatestGames = true;
    update(['HomePage']);

    try {
      var url = Uri.parse('https://api.rawg.io/api/games?page=1&page_size=20&platforms=187&dates=2020-05-18,2021-05-18&ordering=-released&key=$key');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        listGames = GamesList.fromJson(jsonResponse['results']).gamesList!;
        isLoadingLatestGames = false;
        update(['HomePage']);

        return listGames;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Caught error getLatestGames: $e');
      }
    }
    return listGames;
  }

  Future<GameDetails?> getGameDetail({required int gameId}) async {
    isLoadingGameDetail = true;
    update(['DetailPage']);

    try {
      var url = Uri.parse('https://api.rawg.io/api/games/$gameId?key=$key');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        details = GameDetails.fromJson(jsonResponse);
        isLoadingGameDetail = false;
        update(['DetailPage']);

        return details;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Caught error getLatestGames: $e');
      }
    }
    return details;
  }

  Future<List<Screenshots>?> getGameScreenshots({required int gameId}) async {
    isLoadingGameDetail = true;
    update(['DetailPage']);

    try {
      var url = Uri.parse('https://api.rawg.io/api/games/$gameId/screenshots?key=$key');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        listScreenshots = ScreenshotsList.fromJson(jsonResponse['results']).screenshotsList!;
        isLoadingGameDetail = false;
        update(['DetailPage']);

        return listScreenshots;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Caught error getGameScreenshots: $e');
      }
    }
    return listScreenshots;
  }
}
