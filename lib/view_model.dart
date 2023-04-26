import 'package:flutter/widgets.dart';
import 'package:flutter_reverpod_udemy/data/count_data.dart';
import 'package:flutter_reverpod_udemy/logic/button_animation_logic.dart';
import 'package:flutter_reverpod_udemy/logic/count_data_changed_notifier.dart';
import 'package:flutter_reverpod_udemy/logic/logic.dart';
import 'package:flutter_reverpod_udemy/logic/sound_logic.dart';
import 'package:flutter_reverpod_udemy/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModel {
  final Logic _logic = Logic();
  final SoundLogic _soundLogic = SoundLogic();
  late ButtonAnimationLogic _buttonAnimationLogicPlus;
  late ButtonAnimationLogic _buttonAnimationLogicMinus;
  late ButtonAnimationLogic _buttonAnimationLogicReset;

  late WidgetRef _ref;
  List<CountDataChangedNotifier> notifiers = [];

  void setRef(WidgetRef ref, TickerProvider tickerProvider) {
    _ref = ref;
    conditionPlus(CountData oldData, CountData newData) {
      return oldData.countUp + 1 == newData.countUp;
    }

    _buttonAnimationLogicPlus =
        ButtonAnimationLogic(tickerProvider, conditionPlus);
    _buttonAnimationLogicMinus = ButtonAnimationLogic(tickerProvider,
        (CountData oldData, CountData newData) {
      return oldData.countDown + 1 == newData.countDown;
    });
    _buttonAnimationLogicReset = ButtonAnimationLogic(
      tickerProvider,
      (oldData, newData) =>
          newData.countUp == 0 && newData.countDown == 0 && newData.count == 0,
    );
    _soundLogic.load();
    notifiers = [
      _soundLogic,
      _buttonAnimationLogicPlus,
      _buttonAnimationLogicMinus,
      _buttonAnimationLogicReset,
    ];
  }

  get count => _ref.watch(countDataProvider).count.toString();

  get countUp =>
      _ref.watch(countDataProvider.select((value) => value.countUp)).toString();

  get countDown => _ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  get animationPlus => _buttonAnimationLogicPlus.animationScale;
  get animationMinus => _buttonAnimationLogicMinus.animationScale;
  get animationReset => _buttonAnimationLogicReset.animationScale;

  void onIncrease() {
    _logic.increase();
    update();
  }

  void onDecrease() {
    _logic.decrease();
    update();
  }

  void onReset() {
    _logic.reset();
    update();
  }

  void update() {
    CountData oldData = _ref.watch(countDataProvider);
    _ref.read(countDataProvider.notifier).update((state) => _logic.countData);
    CountData newData = _ref.watch(countDataProvider);
    notifiers.forEach((element) => element.valueChanged(oldData, newData));
  }
}
