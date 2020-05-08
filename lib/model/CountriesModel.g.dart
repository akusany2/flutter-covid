// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesModel _$CountriesModelFromJson(Map<String, dynamic> json) {
  return CountriesModel(
    json['Country'] as String,
    json['Slug'] as String,
    json['NewConfirmed'] as int,
    json['TotalConfirmed'] as int,
    json['NewDeaths'] as int,
    json['TotalDeaths'] as int,
    json['NewRecovered'] as int,
    json['TotalRecovered'] as int,
  );
}

Map<String, dynamic> _$CountriesModelToJson(CountriesModel instance) =>
    <String, dynamic>{
      'Country': instance.country,
      'Slug': instance.slug,
      'NewConfirmed': instance.newConfirmed,
      'TotalConfirmed': instance.totalConfirmed,
      'NewDeaths': instance.newDeaths,
      'TotalDeaths': instance.totalDeaths,
      'NewRecovered': instance.newRecovered,
      'TotalRecovered': instance.totalRecovered,
    };
