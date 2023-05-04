import 'package:clean_architecture/domain/home/entity/pokemon_details_model.dart';
import 'package:clean_architecture/domain/home/entity/pokemon_model.dart';

abstract class GetPokemonsRepository {
  Future<PokemonModel> getPokemons(String url);
}

abstract class GetPokemonInfoRepository {
  Future<PokemonInfoModel> getPokemonInfo(String url);
}
