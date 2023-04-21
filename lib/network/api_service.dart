
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterexercise/model/coin_model.dart';
import 'package:flutterexercise/model/ohlcv_model.dart';
import 'package:flutterexercise/model/rank_model.dart';
import 'package:flutterexercise/network/api_client.dart';
import 'package:flutterexercise/network/coin_endpoint.dart';

class ApiService{

  final ApiClient _apiClient;

  ApiService(this._apiClient);

  Future<List<RankCoinModel>> getCoinRank() async{
    try {
      // final response = await _apiClient.dio.get(CoinEndpoint.getCoins);
      // List <CoinModel> coinList = [];
      // if(response.statusCode == 200) {
      //   List data = response.data;
      //   data.asMap().forEach((key, value) async {
      //     if (key < 5) {
      //       Map<String, dynamic> defectMap = value;
      //       CoinModel coinModel = await getCoinInfo(defectMap['id']);
      //       await Future.delayed(Duration(seconds: 1));
      //       // CoinModel coinModel = CoinModel.fromJson(defectMap);
      //       // if(coinModel != null) {
      //       //   coinList.add(coinModel);
      //       // }
      //       coinList.add(coinModel);
      //     } else {
      //       return;
      //     }
      //   });
      // }
      // return coinList;
      final response = await _apiClient.dio.get(CoinEndpoint.getCoins);
      List <RankCoinModel> coinList = [];
      if(response.statusCode == 200) {
        List data = response.data;
        data.asMap().forEach((key, value) {
          if (key < 10) {
            Map<String, dynamic> defectMap = value;
            RankCoinModel rankCoinModel = RankCoinModel.fromJson(defectMap);
            coinList.add(rankCoinModel);
          } else {
            return;
          }
        });
      }
      return coinList;
    }on DioError catch(ex){
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }
  }

  Future<CoinModel> getCoinInfo(String coin_id) async{
    try {
      final response = await _apiClient.dio.get('${CoinEndpoint.getCoins}/$coin_id');
      late CoinModel coinModel;
      if(response.statusCode == 200) {
        coinModel = CoinModel.fromJson(response.data);
      }
      return coinModel;
    }on DioError catch(ex){
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }

  }

  Future asd(int currentLength) async{

  }

  Future<double> getPrice(String id) async{
    try {
      final response = await _apiClient.dio.get(CoinEndpoint.getPrice,queryParameters: {
        'base_currency_id': id,
        'quote_currency_id':'usd-us-dollars',
        'amount' : 1
      });

      if(response.statusCode == 200) {
        return response.data['price'];
      }
      return 0;
    }on DioError catch(ex){
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }
  }

  Future<OhlcvModel> getOhlcv(String id) async{
    try {
      final response = await _apiClient.dio.get('${CoinEndpoint.getCoins}/$id${CoinEndpoint.getLatestOHLC}');
      late OhlcvModel ohlcvModel;
      if(response.statusCode == 200) {
        List data = response.data;
        ohlcvModel = OhlcvModel.fromJson(data[0]);
      }
      return ohlcvModel;
    }on DioError catch(ex){
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }
  }
}