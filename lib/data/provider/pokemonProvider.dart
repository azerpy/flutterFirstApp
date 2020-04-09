import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:m2_app/data/models/Pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dioHelper.dart';

class PokemonProvider {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<Pokemon> getDitto() async {
    var dio = Dio();

    Response dittoResponse = await dio.get("https://pokeapi.co/api/v2/pokemon/ditto/");
    Pokemon pokemon =  Pokemon.fromJsonMap(dittoResponse.data);

    dio.post("https://pokeapi.co/api/v2/pokemon/", data: pokemon.toJson());

    final SharedPreferences prefs = await _prefs;
    prefs.setString("MyFacPokemon", pokemon.toString());

    _storage.write(key: "MyFavPokemon", value: pokemon.name);

  }

  Future<Pokemon> getDittoV2() async {
    DioHelper dioHelper = DioHelper.instance;
    final resp = await dioHelper.get("/ditto");
    var test = jsonDecode(resp);
    return Pokemon.fromJsonMap(test);

  }
}