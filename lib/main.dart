import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reverpod_udemy/data/count_data.dart';
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

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("MyHomePave rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.watch(titleProvider),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(ref.watch(messageProvider)),
            Text(
              ref.watch(countDataProvider).count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    CountData countData =
                        ref.read(countDataProvider.notifier).state;
                    ref.read(countDataProvider.notifier).update((state) =>
                        countData.copyWith(
                            count: state.count + 1,
                            countUp: state.countUp + 1));
                  },
                  child: const Icon(CupertinoIcons.plus),
                  // This trailing comma makes auto-formatting nicer for build methods.
                ),
                FloatingActionButton(
                  onPressed: () {
                    CountData countData =
                        ref.read(countDataProvider.notifier).state;
                    ref.read(countDataProvider.notifier).update((state) =>
                        countData.copyWith(
                            count: state.count - 1,
                            countDown: state.countDown - 1));
                  },
                  child: const Icon(CupertinoIcons.minus),
                  // This trailing comma makes auto-formatting nicer for build methods.
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(ref
                    .watch(countDataProvider.select((value) => value.countUp))
                    .toString()),
                Text(ref
                    .watch(countDataProvider.select((value) => value.countDown))
                    .toString()),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(countDataProvider.notifier).update(
              (state) => const CountData(count: 0, countUp: 0, countDown: 0));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
