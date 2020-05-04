import 'package:json_annotation/json_annotation.dart';

part 'GlobalModel.g.dart';

@JsonSerializable(explicitToJson: true)
class GlobalModel {
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

  GlobalModel(this.newConfirmed, this.totalConfirmed, this.newDeaths,
      this.totalDeaths, this.newRecovered, this.totalRecovered);

  factory GlobalModel.fromJson(Map<String, dynamic> json) =>
      _$GlobalModelFromJson(json);
  Map<String, dynamic> toJson() => _$GlobalModelToJson(this);
}
