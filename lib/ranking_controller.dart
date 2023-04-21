import 'package:flutter/cupertino.dart';
import 'package:flutterexercise/model/coin_model.dart';
import 'package:flutterexercise/model/rank_model.dart';
import 'package:flutterexercise/network/api_client.dart';
import 'package:flutterexercise/network/api_service.dart';

class RankingController extends ChangeNotifier{
  late List<RankCoinModel> _currentRanking = [];
  late List<RankCoinModel> _allRanking = [];

  bool isLoading = false;


  List<RankCoinModel> get currentRanking => _currentRanking;

  getRanking()async{
    ApiClient apiClient = ApiClient();
    ApiService apiService = ApiService(apiClient);
    isLoading = true;

    _currentRanking = await apiService.getCoinRank();
    // _allRanking = await apiService.getCoinRank();
    notifyListeners();
    // loadMore(_currentRanking.length);
  }

  // loadMore(int currentLength) async{
  //   _currentRanking.addAll(_allRanking.getRange(currentLength, currentLength+2).toList());
  //   isLoading = false;
  //   notifyListeners();
  // }

  Future<CoinModel> getCoinInfo(String coin_id) async {
    ApiClient apiClient = ApiClient();
    ApiService apiService = ApiService(apiClient);

    CoinModel coinModel =  await apiService.getCoinInfo(coin_id);
    coinModel.price = await apiService.getPrice(coin_id);
    coinModel.ohlcvModel = await apiService.getOhlcv(coin_id);
    return coinModel;
  }

  Future<double> getPrice(String coin_id) async {
    ApiClient apiClient = ApiClient();
    ApiService apiService = ApiService(apiClient);

    return await apiService.getPrice(coin_id);

  }
}