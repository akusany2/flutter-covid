import 'dart:convert';

import 'package:covid/model/APIResponseModel.dart';
import 'package:covid/model/CovidAPIModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CovidAPIService {
  static const String apiURL =
      'https://coronavirus-19-api.herokuapp.com/countries';
  static const String localURL = 'http://172.31.178.209:8080/covid.json';
  static const String localURLNew = 'http://172.31.178.209:8080/summary.json';
  static var allData;
  static List<APIResponseModel> parseJson(json) {
    return json
        .where((item) => item["country"] != "")
        .map<APIResponseModel>((item) => APIResponseModel.fromJSON(item))
        .toList();
  }

  static parseJsonNew(json) {
    return {
      "Global": json.Global,
      "Countries": json.Countries.map<CovidAPIModel>(
          (item) => CovidAPIModel.fromJSON(item)).toList()
    };
  }

  static Future getAllData({bool forceUpdate = false}) async {
    if (!forceUpdate && allData != null && allData.length > 0) {
      return await allData;
    } else {
      final res = await http.get(localURLNew);

      // allData = await compute(CovidAPIService.parseJson, jsonDecode(res.body));
      allData =
          await compute(CovidAPIService.parseJsonNew, jsonDecode(res.body));

      return allData;
    }
  }
}
