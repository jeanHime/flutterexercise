import 'package:flutterexercise/model/ohlcv_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel {
  final String id, name, symbol, logo;
  final int rank;
  final bool is_active;
  double? price;
  OhlcvModel? ohlcvModel;

  CoinModel({
        required this.id,
        required this.name,
        required this.symbol,
        required this.logo,
        required this.rank,
        required this.is_active,
        this.price,
      });

  factory CoinModel.fromJson(Map<String, dynamic> json) => _$CoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinModelToJson(this);
}
