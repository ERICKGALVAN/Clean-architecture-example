import 'package:http/http.dart' as http;

import '../../domain/home/entity/pokemon_details_model.dart';
import '../../domain/home/repository/get_pokemons_repository.dart';

class PokemonInfoApi extends GetPokemonInfoRepository {
  @override
  Future<PokemonInfoModel> getPokemonInfo(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final pokemonInfo = pokemonInfoModelFromJson(response.body);
      return pokemonInfo;
    }
    throw UnimplementedError();
  }
}
