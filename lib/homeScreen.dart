import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// to read the value from the provider
final helloProvider = Provider<String>((ref) {
  return "Hello, World!";
});

// state provider
final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build");
    // get the value from the provider
    final hello = ref.watch(helloProvider);
    // final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(hello),
            const SizedBox(height: 20),
            // cunsumer widget to read the value from the provider
            Consumer(builder: (context, ref, child) {
              // get the value from the provider
              // watch -> to get the value from the provider
              // read -> to read the value from the provider and update the value
              final count = ref.watch(counterProvider);
              print("Text widget build");
              return Text('Counter: ' + count.toString());
            }),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // read the value from the provider and update the value
                    ref.read(counterProvider.notifier).state--;
                  },
                  child: const Text('-'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // read the value from the provider and update the value
                    ref.read(counterProvider.notifier).state++;
                  },
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
