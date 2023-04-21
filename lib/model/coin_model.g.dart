// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => CoinModel(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      logo: json['logo'] as String,
      rank: json['rank'] as int,
      is_active: json['is_active'] as bool,
      price: (json['price'] as num?)?.toDouble(),
    )..ohlcvModel = json['ohlcvModel'] == null
        ? null
        : OhlcvModel.fromJson(json['ohlcvModel'] as Map<String, dynamic>);

Map<String, dynamic> _$CoinModelToJson(CoinModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'logo': instance.logo,
      'rank': instance.rank,
      'is_active': instance.is_active,
      'price': instance.price,
      'ohlcvModel': instance.ohlcvModel,
    };
