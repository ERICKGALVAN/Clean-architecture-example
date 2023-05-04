import 'package:clean_architecture/data/api_constants.dart';
import 'package:clean_architecture/domain/home/entity/pokemon_model.dart';
import 'package:clean_architecture/domain/home/repository/get_pokemons_repository.dart';
import 'package:http/http.dart' as http;

class PokeApiClient extends GetPokemonsRepository {
  static const firstPage = ApiConstants.firstPage;

  @override
  Future<PokemonModel> getPokemons(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final pokemons = pokemonModelFromJson(response.body);
      return pokemons;
    } else {
      throw Exception('Failed to load Pokemon list');
    }
  }
}
