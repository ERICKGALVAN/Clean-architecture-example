import 'package:clean_architecture/data/remote/pokemon_info_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonInfoProvider = FutureProvider.family.autoDispose(
  (ref, String url) async {
    final pokemonInfo = await PokemonInfoApi().getPokemonInfo(url);
    return pokemonInfo;
  },
);
