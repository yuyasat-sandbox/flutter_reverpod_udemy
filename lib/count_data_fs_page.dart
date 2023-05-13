import 'package:flutter/material.dart';
import 'package:flutter_reverpod_udemy/provider.dart';
import 'package:flutter_reverpod_udemy/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'button_animation.dart';

class CountDataFsPage extends ConsumerStatefulWidget {
  final ViewModel viewModel;
  const CountDataFsPage(this.viewModel, {super.key});

  @override
  ConsumerState<CountDataFsPage> createState() => _CountDataFsPageState();
}

class _CountDataFsPageState extends ConsumerState<CountDataFsPage>
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
