import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reverpod_udemy/main.dart';
import 'package:flutter_reverpod_udemy/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens("normal", (tester) async {
    const iPhone55 = Device(
      name: 'iPhone 55',
      size: Size(414, 736),
      devicePixelRatio: 3.0,
    );

    List<Device> devices = [iPhone55];

    ViewModel viewModel = ViewModel();

    await tester.pumpWidgetBuilder(ProviderScope(child: MyHomePage(viewModel)));
    await multiScreenGolden(
      tester,
      'myHomePage_0init',
      devices: devices,
    );

    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();

    await multiScreenGolden(
      tester,
      'myHomePage_2plus_1minus_tapped',
      devices: devices,
    );
  });
}
