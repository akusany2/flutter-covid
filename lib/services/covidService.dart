import 'dart:convert';

import 'package:covid/model/APIResponseModel.dart';
import 'package:covid/model/CountriesModel.dart';
import 'package:covid/model/CovidApiModel.dart';
import 'package:covid/model/GlobalModel.dart';
import 'package:http/http.dart' as http;

class CovidAPIService {
  static const String countryDataUrl = 'https://api.covid19api.com/summary';

  static const String localURLNew = 'http://172.31.178.209:8080/summary.json';
  static var allData;

  String apiUrl = 'https://api.covid19api.com';

  static List<APIResponseModel> parseJson(json) {
    return json
        .where((item) => item["country"] != "")
        .map<APIResponseModel>((item) => APIResponseModel.fromJSON(item))
        .toList();
  }

  static CovidApiModel parseJsonNew(json) {
    return CovidApiModel(
        GlobalModel.fromJson(json["Global"]),
        json["Countries"]
            .map<CountriesModel>((item) => CountriesModel.fromJson(item))
            .toList());
  }

  static Future getAllData({bool forceUpdate = false}) async {
    if (!forceUpdate && allData != null) {
      return await allData;
    } else {
      final res = await http.get(countryDataUrl);

      // allData = await compute(CovidAPIService.parseJson, jsonDecode(res.body));
      // allData = await compute(CovidAPIService.parseJsonNew, jsonDecode(res.body));
      allData = CovidAPIService.parseJsonNew(jsonDecode(res.body));

      return allData;
    }
  }

  CovidApiModel get covidData => allData;
}
