import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reverpod_udemy/postal_code_page.dart';
import 'package:flutter_reverpod_udemy/provider.dart';
import 'package:flutter_reverpod_udemy/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'button_animation.dart';
import 'count_data_fs_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

class _MyHomePageState extends ConsumerState<MyHomePage>
    with TickerProviderStateMixin {
  late ViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;
    _viewModel.setRef(ref, this);
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
                  heroTag: "increase",
                  onPressed: _viewModel.onIncrease,
                  child: ButtonAnimation(
                      animationConbination: _viewModel.animationPlusCombination,
                      child: const Icon(CupertinoIcons.plus)),
                ),
                FloatingActionButton(
                  heroTag: "decrease",
                  onPressed: _viewModel.onDecrease,
                  child: ButtonAnimation(
                      animationConbination:
                          _viewModel.animationMinusCombination,
                      child: const Icon(CupertinoIcons.minus)),
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
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostalCodePage(),
                  ),
                )
              },
              child: const Text('PostalCodeページに行く'),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CountDataFsPage("Flutter Demo"),
                  ),
                )
              },
              child: const Text('CoutUpFirebaseページに行く'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "reset",
        onPressed: _viewModel.onReset,
        tooltip: 'Increment',
        child: ButtonAnimation(
          animationConbination: _viewModel.animationResetCombination,
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
