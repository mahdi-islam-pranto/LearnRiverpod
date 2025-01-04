import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// to read the value from the provider
final helloProvider = Provider<String>((ref) {
  return "Hello, World!";
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get the value from the provider
    final hello = ref.watch(helloProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(hello),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
