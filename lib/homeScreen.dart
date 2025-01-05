import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// const provider -> whitch will not change
final helloProvider = Provider<String>((ref) {
  return "Make sure to check the console";
});

// state provider -> whitch will change
final counterProvider = StateProvider<int>((ref) {
  return 0;
});

// state provider -> whitch will change
final switchProvider = StateProvider<bool>((ref) {
  return false;
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
        centerTitle: true,
        title: const Text('Counter and Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // read the value from the provider and update the value
                ref.read(counterProvider.notifier).state = 0;
              },
              child: const Text('Reset'),
            ),

            // switch
            const SizedBox(height: 40),

            Text('Make sure to check the console'),

            const SizedBox(height: 10),

            // cunsumer widget to read the value from the provider
            Consumer(builder: (context, ref, child) {
              // get the value from the provider
              final switchValue = ref.watch(switchProvider);
              return Text('Switch value: ' + switchValue.toString());
            }),

            const SizedBox(height: 10),

            // cunsumer widget to read the value from the provider
            Consumer(builder: (context, ref, child) {
              // get the value from the provider
              final switchValue = ref.watch(switchProvider);
              return Switch(
                value: switchValue,
                onChanged: (value) {
                  // read the value from the provider and update the value
                  ref.read(switchProvider.notifier).state = value;
                  print(value);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
