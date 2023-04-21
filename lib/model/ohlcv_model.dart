import 'package:json_annotation/json_annotation.dart';

part 'ohlcv_model.g.dart';

@JsonSerializable()
class OhlcvModel {
  double open, close, high, low;
  int volume, market_cap;

  OhlcvModel({
      required this.open,
      required this.close,
      required this.high,
      required this.low,
      required this.volume,
      required this.market_cap});

  factory OhlcvModel.fromJson(Map<String, dynamic> json) => _$OhlcvModelFromJson(json);

  Map<String, dynamic> toJson() => _$OhlcvModelToJson(this);
}
