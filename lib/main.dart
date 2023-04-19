import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reverpod_udemy/provider.dart';
import 'package:flutter_reverpod_udemy/view_model.dart';
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
      home: MyHomePage(ViewModel()),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends ConsumerStatefulWidget {
  final ViewModel viewModel;
  const MyHomePage(this.viewModel, {super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late ViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;
    _viewModel.setRef(ref);
  }

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
              _viewModel.count,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: _viewModel.onIncrease,
                  child: const Icon(CupertinoIcons.plus),
                  // This trailing comma makes auto-formatting nicer for build methods.
                ),
                FloatingActionButton(
                  onPressed: _viewModel.onDecrease,
                  child: const Icon(CupertinoIcons.minus),
                  // This trailing comma makes auto-formatting nicer for build methods.
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_viewModel.countUp),
                Text(_viewModel.countDown),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewModel.onReset,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
