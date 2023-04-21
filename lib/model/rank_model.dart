import 'package:json_annotation/json_annotation.dart';

part 'rank_model.g.dart';

@JsonSerializable()
class RankCoinModel{
  final String id, name, symbol;
  final int rank;
  final bool is_active;

  RankCoinModel({required this.id, required this.name, required this.symbol, required this.rank, required this.is_active});

  factory RankCoinModel.fromJson(Map<String, dynamic> json) => _$RankCoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$RankCoinModelToJson(this);
}