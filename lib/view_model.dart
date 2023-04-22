import 'package:flutter_reverpod_udemy/logic/logic.dart';
import 'package:flutter_reverpod_udemy/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModel {
  final Logic _logic = Logic();
  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  get count => _ref.watch(countDataProvider).count.toString();

  get countUp =>
      _ref.watch(countDataProvider.select((value) => value.countUp)).toString();

  get countDown => _ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  void onIncrease() {
    _logic.increase();
    _ref.read(countDataProvider.notifier).update((state) => _logic.countData);
  }

  void onDecrease() {
    _logic.decrease();
    _ref.read(countDataProvider.notifier).update((state) => _logic.countData);
  }

  void onReset() {
    _logic.reset();
    _ref.read(countDataProvider.notifier).update((state) => _logic.countData);
  }
}
