import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:m2_app/data/models/Pokemon.dart';
import 'package:m2_app/data/models/cat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatsProvider {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Response> getCats() async {
    var dio = Dio();
    dio.options.headers["x-api-key"] = "67d0d2df-bf7f-413e-b8ea-323eb0b12638";

    Response catsResponse = await dio.get("https://api.thecatapi.com/v1/images/search?limit=10");
    debugPrint(catsResponse.data.toString());
    return catsResponse;
  }
}