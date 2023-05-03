import 'package:clean_architecture/domain/home/entity/pokemon_model.dart';

abstract class GetPokemonsRepository {
  Future<PokemonModel> getPokemons();
}
