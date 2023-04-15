import 'package:flutter/material.dart';
import 'package:flutter_reverpod_udemy/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("MyHomePave rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              Text(ref.watch(titleProvider)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                  Text(ref.watch(messageProvider)),
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                  Text(
                ref.watch(countProvider).toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) =>
            FloatingActionButton(
          onPressed: () =>
              ref.read(countProvider.notifier).update((state) => state + 1),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
