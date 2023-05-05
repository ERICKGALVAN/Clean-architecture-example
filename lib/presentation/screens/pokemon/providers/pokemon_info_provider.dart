import 'package:clean_architecture/data/remote/pokeapi_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonInfoProvider = FutureProvider.family.autoDispose(
  (ref, String url) async {
    final pokemonInfo = await PokeApiClient().getPokemonInfo(url);
    return pokemonInfo;
  },
);
