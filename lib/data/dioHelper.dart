import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:m2_app/data/appException.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {

  Dio _dio;

  DioHelper._privateConstructor(){
    _dio = Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/pokemon/"));


    _dio.interceptors.add(PrettyDioLogger(
        responseHeader: true,
        requestBody: true,
        responseBody: true,
        compact: false
    ));

    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options) {
          //if(token != null){
          //  _dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer "+token;
          //}
        }));
  }

  dynamic _returnResponse(Response response){
    switch(response.statusCode){
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data["Status"]);
    }
  }

  Future<dynamic> get(String route, [Map<String, dynamic> parameters]) async {
    var responseJson;
    try {
      final response = await _dio.get(route, queryParameters: parameters);
      responseJson = response.data;
    } on SocketException {
      debugPrint("No network");
    } on DioError catch(e) {
      _returnResponse(e.response);
    }

    return responseJson;
  }

  Future<dynamic> post(String route, [dynamic data, Map<String, dynamic> params, Options options]) async {
    var responseJson;
    try {
      final response = await _dio.post(route, data: data, options: options);
      responseJson = response.data;
    } on SocketException {
      debugPrint("No network");
    } on DioError catch(e) {
      _returnResponse(e.response);
    }

    return responseJson;
  }


  static final DioHelper _instance = DioHelper._privateConstructor();
  static DioHelper get instance => _instance;

}