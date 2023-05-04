import 'package:clean_architecture/domain/home/entity/pokemon_model.dart';
import 'package:clean_architecture/presentation/screens/pokemon/providers/pokemon_info_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonDetailsScreen extends ConsumerWidget {
  const PokemonDetailsScreen({
    Key? key,
    required this.currentPokemon,
  }) : super(key: key);
  final PokemonDetail currentPokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(
      pokemonInfoProvider(
        currentPokemon.url,
      ),
    );
    return pokemon.when(
      data: (poke) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            poke.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.network(
                  poke.sprites.frontDefault,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
      error: (_, __) => const Center(
        child: Text(
          'Could not get data',
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
