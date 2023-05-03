import 'dart:convert';

import 'package:clean_architecture/domain/home/entity/pokemon_model.dart';
import 'package:clean_architecture/domain/home/repository/get_pokemons_repository.dart';
import 'package:http/http.dart' as http;

class PokeApiClient extends GetPokemonsRepository {
  static const baseUrl = 'https://pokeapi.co/api/v2/';
  Future<List<dynamic>> getPokemonList(int limit) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon?limit=$limit'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final results = json['results'] as List<dynamic>;
      return results;
    } else {
      throw Exception('Failed to load Pokemon list');
    }
  }

  Future<dynamic> getPokemon(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$name'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Failed to load Pokemon data');
    }
  }

  @override
  Future<PokemonModel> getPokemons() {
    // TODO: implement getPokemons
    throw UnimplementedError();
  }
}
