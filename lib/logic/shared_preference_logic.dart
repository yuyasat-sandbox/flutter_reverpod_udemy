import 'package:flutter_reverpod_udemy/data/count_data.dart';
import 'package:flutter_reverpod_udemy/logic/count_data_changed_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLogic with CountDataChangedNotifier {
  static const keyCount = 'COUNT';
  static const keyCountUp = 'COUNT_UP';
  static const keyCountDown = 'COUNT_DOWN';
  @override
  void valueChanged(CountData oldData, CountData newData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(keyCount, newData.count);
    sharedPreferences.setInt(keyCountUp, newData.countUp);
    sharedPreferences.setInt(keyCountDown, newData.countDown);
  }

  static Future<CountData> read() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return CountData(
      count: sharedPreferences.getInt(keyCount) ?? 0,
      countUp: sharedPreferences.getInt(keyCountUp) ?? 0,
      countDown: sharedPreferences.getInt(keyCountDown) ?? 0,
    );
  }
}
