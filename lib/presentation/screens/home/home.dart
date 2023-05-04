import 'package:clean_architecture/presentation/screens/home/providers/pokemon_provider.dart';
import 'package:clean_architecture/presentation/screens/home/widgets/change_page_button.dart';
import 'package:clean_architecture/presentation/screens/home/widgets/name_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  void _changePage(String? page, WidgetRef ref) async {
    ref.refresh(pokemonProvider);
    ref.read(currentPage.notifier).update((state) => page!);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemons = ref.watch(pokemonProvider);
    final prev = ref.watch(prevLink);
    final next = ref.watch(nextLink);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Clean Architecture',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
          ),
        ),
      ),
      body: pokemons.when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.pokemonDetail.length,
                  itemBuilder: (context, index) {
                    return NameContainer(
                      name: data.pokemonDetail[index].name,
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    prev != null
                        ? InkWell(
                            onTap: () {
                              _changePage(prev, ref);
                            },
                            child: const ChangePageButton(
                              isLeft: true,
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      width: 40,
                    ),
                    next != null
                        ? InkWell(
                            onTap: () {
                              _changePage(next, ref);
                            },
                            child: const ChangePageButton(
                              isLeft: false,
                            ),
                          )
                        : Container(),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        },
        error: (_, __) => const Center(
          child: Text(
            'Error cargando',
          ),
        ),
        loading: () => const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
