// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankCoinModel _$RankCoinModelFromJson(Map<String, dynamic> json) =>
    RankCoinModel(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      rank: json['rank'] as int,
      is_active: json['is_active'] as bool,
    );

Map<String, dynamic> _$RankCoinModelToJson(RankCoinModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'rank': instance.rank,
      'is_active': instance.is_active,
    };
