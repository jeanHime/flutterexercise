
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiClient{
  late Dio dio;

  ApiClient(){
    dio = Dio();
    dio.interceptors.add(ApiInterceptors());
    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);
    dio.options.sendTimeout = const Duration(seconds: 15);
    dio.options
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15)
      ..sendTimeout = const Duration(seconds: 15)
      ..baseUrl = "https://api.coinpaprika.com/v1"
    ;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  RequestOptions onRequest(RequestOptions options,
      RequestInterceptorHandler handler) {
    // do something before request is sent

    debugPrint("baseUrl: ${options.baseUrl}");
    debugPrint("Request Path: ${options.path}");
    debugPrint("Request Query Parameters: ${options.queryParameters}");
    debugPrint("Request Query Parameters: ${options.data.toString()}");
    debugPrint("Request Query Parameters: ${options.contentType}");

    handler.next(options);
    return options;
  }


  @override
  DioError onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint("Error Status Code: ${err.response?.statusCode}");
    debugPrint("Error Status Message: ${err.response?.statusMessage}");
    handler.next(err);
    return err;
  }

  @override
  Response onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("Response Status Code: ${response.statusCode}");
    debugPrint("Response Status Message: ${response.statusMessage}");
    debugPrint("Response Data: ${response.data}");
    handler.next(response);
    return response;
  }

}
