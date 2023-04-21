// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ohlcv_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OhlcvModel _$OhlcvModelFromJson(Map<String, dynamic> json) => OhlcvModel(
      open: (json['open'] as num).toDouble(),
      close: (json['close'] as num).toDouble(),
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      volume: json['volume'] as int,
      market_cap: json['market_cap'] as int,
    );

Map<String, dynamic> _$OhlcvModelToJson(OhlcvModel instance) =>
    <String, dynamic>{
      'open': instance.open,
      'close': instance.close,
      'high': instance.high,
      'low': instance.low,
      'volume': instance.volume,
      'market_cap': instance.market_cap,
    };
