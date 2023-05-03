import 'package:clean_architecture/presentation/screens/home/providers/test_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
      body: Center(
        child: Text(
          count.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(countProvider.notifier).update((state) => state + 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
