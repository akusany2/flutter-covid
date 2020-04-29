class APIResponseModel {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int totalTests;
  int testsPerOneMillion;
  bool isOpened;

  APIResponseModel(
      {this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.totalTests,
      this.testsPerOneMillion,
      this.isOpened});

  Map<String, dynamic> toJSON() {
    return {
      "Cases": cases.toString(),
      "Today Cases": todayCases.toString(),
      "Deaths": deaths.toString(),
      "Today Deaths": todayDeaths.toString(),
      "Recovered": recovered.toString(),
      "Active": active.toString(),
      "Critical": critical.toString(),
      "Cases Per One Million": casesPerOneMillion.toString(),
      "Deaths Per One Million": deathsPerOneMillion.toString(),
      "Total Tests": totalTests.toString(),
      "Tests Per One Million": testsPerOneMillion.toString(),
    };
  }

  factory APIResponseModel.fromJSON(Map<String, dynamic> json) {
    return APIResponseModel(
        country: json["country"] as String,
        cases: json["cases"] as int,
        todayCases: json["todayCases"] as int,
        deaths: json["deaths"] as int,
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"] as int,
        active: json["active"] as int,
        critical: json["critical"] as int,
        casesPerOneMillion: json["casesPerOneMillion"] as int,
        deathsPerOneMillion: json["deathsPerOneMillion"] as int,
        totalTests: json["totalTests"] as int,
        testsPerOneMillion: json["testsPerOneMillion"] as int,
        isOpened: false);
  }
}
