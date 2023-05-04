import 'package:clean_architecture/data/api_constants.dart';
import 'package:clean_architecture/data/remote/pokeapi_client.dart';
import 'package:clean_architecture/domain/home/entity/pokemon_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonProvider = FutureProvider<PokemonModel>((ref) async {
  final url = ref.watch(currentPage);
  final pokemons = await PokeApiClient().getPokemons(url);
  ref.watch(prevLink.notifier).update((state) => pokemons.previous);
  ref.watch(nextLink.notifier).update((state) => pokemons.next);
  return pokemons;
});

final currentPage = StateProvider<String>((ref) => ApiConstants.firstPage);

final prevLink = StateProvider<String?>((ref) => null);

final nextLink = StateProvider<String?>((ref) => null);
