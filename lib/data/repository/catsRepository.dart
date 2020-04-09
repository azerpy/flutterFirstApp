import 'package:dio/dio.dart';
import 'package:m2_app/data/models/cat.dart';
import 'package:m2_app/data/provider/catsProvider.dart';

class CatsRepository {

  CatsRepository._privateConstructor();
  static final CatsRepository _instance = CatsRepository._privateConstructor();
  static CatsRepository get instance => _instance;

  Future<Cat> firstCat() async {
    Response response = await CatsProvider().getCats();

    if(response.data is List){
      List data = response.data;
      List<Cat> cats = data.map((object) => Cat.fromJson(object)).toList();
      return cats[0];
    } else if(response.statusCode == 204){
      return null;
    }
  }

  Future<List<Cat>> getCats() async {
    Response response = await CatsProvider().getCats();
    if(response.data is List){
      List data = response.data;
      List<Cat> cats = data.map((object) => Cat.fromJson(object)).toList();
      return cats;
    } else if(response.statusCode == 204){
      return null;
    }
  }
}