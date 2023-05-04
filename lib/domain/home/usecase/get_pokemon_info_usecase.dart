import 'package:clean_architecture/domain/home/entity/pokemon_details_model.dart';
import 'package:clean_architecture/domain/home/repository/get_pokemons_repository.dart';

class GetPokemonInfoUsecase {
  final GetPokemonInfoRepository _pokemonInfoRepository;

  GetPokemonInfoUsecase(this._pokemonInfoRepository);

  Future<PokemonInfoModel> getPokemonInfo(String url) async {
    return await _pokemonInfoRepository.getPokemonInfo(url);
  }
}
