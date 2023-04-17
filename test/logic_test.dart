import 'package:flutter_reverpod_udemy/logic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Logic target = Logic();
  setUp(() async {
    target = Logic();
  });

  test('init', () async {
    expect(target.countData.count, 0);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 0);
  });
  test('increase', () async {
    target.increase();
    expect(target.countData.count, 1);
    expect(target.countData.countUp, 1);
    expect(target.countData.countDown, 0);

    target.increase();
    target.increase();
    target.increase();
    expect(target.countData.count, 4);
    expect(target.countData.countUp, 4);
    expect(target.countData.countDown, 0);
  });
  test('decreaase', () async {
    target.decrease();
    expect(target.countData.count, -1);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 1);

    target.decrease();
    target.decrease();
    target.decrease();
    expect(target.countData.count, -4);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 4);
  });
  test('reset', () async {
    expect(target.countData.count, 0);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 0);

    target.increase();
    target.increase();
    expect(target.countData.count, 2);
    expect(target.countData.countUp, 2);
    expect(target.countData.countDown, 0);
    target.reset();
    expect(target.countData.count, 0);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 0);
  });
}
