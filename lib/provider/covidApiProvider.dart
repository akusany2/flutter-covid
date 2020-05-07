import 'package:covid/model/CovidApiModel.dart';
import 'package:covid/services/covidService.dart';
import 'package:flutter/foundation.dart';

class CovidApiProvider with ChangeNotifier {
  CovidApiModel _covidData;

  CovidApiModel get covidData => _covidData;

  Future getCovidData({bool forceUpdate = false}) async {
    _covidData = await CovidAPIService.getAllData(forceUpdate: forceUpdate);
    notifyListeners();
    return _covidData;
  }
}
