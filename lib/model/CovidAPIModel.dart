import 'package:covid/model/CountriesModel.dart';
import 'package:covid/model/GlobalModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CovidApiModel.g.dart';

@JsonSerializable(explicitToJson: true)
class CovidApiModel {
  @JsonKey(name: 'Global')
  GlobalModel global;
  @JsonKey(name: "Countries")
  List<CountriesModel> countries;
  CovidApiModel(this.global, this.countries);
  factory CovidApiModel.fromJson(Map<String, dynamic> json) =>
      _$CovidApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$CovidApiModelToJson(this);
}
