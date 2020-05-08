import 'package:json_annotation/json_annotation.dart';

part 'CountriesModel.g.dart';

@JsonSerializable(explicitToJson: true)
class CountriesModel {
  @JsonKey(name: 'Country')
  String country;
  // @JsonKey(name: 'CountryCode')
  // String countryCode;
  @JsonKey(name: 'Slug')
  String slug;
  @JsonKey(name: 'NewConfirmed')
  int newConfirmed;
  @JsonKey(name: 'TotalConfirmed')
  int totalConfirmed;
  @JsonKey(name: 'NewDeaths')
  int newDeaths;
  @JsonKey(name: 'TotalDeaths')
  int totalDeaths;
  @JsonKey(name: 'NewRecovered')
  int newRecovered;
  @JsonKey(name: 'TotalRecovered')
  int totalRecovered;
  // @JsonKey(name: 'Date')
  // String date;

  // bool isOpened;

  CountriesModel(
    this.country,
    // this.countryCode,
    this.slug,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    // this.date,
    // this.isOpened
  );

  factory CountriesModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesModelToJson(this);
}
