// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CovidApiModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidApiModel _$CovidApiModelFromJson(Map<String, dynamic> json) {
  return CovidApiModel(
    json['Global'] == null
        ? null
        : GlobalModel.fromJson(json['Global'] as Map<String, dynamic>),
    (json['Countries'] as List)
        ?.map((e) => e == null
            ? null
            : CountriesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CovidApiModelToJson(CovidApiModel instance) =>
    <String, dynamic>{
      'Global': instance.global?.toJson(),
      'Countries': instance.countries?.map((e) => e?.toJson())?.toList(),
    };
