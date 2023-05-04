import 'package:clean_architecture/data/api_constants.dart';
import 'package:clean_architecture/domain/home/entity/pokemon_model.dart';
import 'package:clean_architecture/domain/home/repository/get_pokemons_repository.dart';

class GetPokemonsUseCase {
  final GetPokemonsRepository _pokemonRepository;

  GetPokemonsUseCase(this._pokemonRepository);

  Future<PokemonModel> getAllPokemons() async {
    const firstPage = ApiConstants.firstPage;
    return await _pokemonRepository.getPokemons(firstPage);
  }
}
