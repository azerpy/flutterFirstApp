import 'package:m2_app/data/models/Pokemon.dart';
import 'package:m2_app/data/provider/pokemonProvider.dart';

class PokemonRepository{

  Future<Pokemon> getDitto() => PokemonProvider().getDittoV2();

}