import 'package:flutter_reverpod_udemy/data/count_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) {
  return 'Riverpod Demo Home Page';
});

final messageProvider =
    Provider<String>((ref) => 'You have pushed the button this many times:');

final countProvider = StateProvider<int>((ref) => 0);

final countDataProvider = StateProvider<CountData>(
    (ref) => const CountData(count: 0, countUp: 0, countDown: 0));
