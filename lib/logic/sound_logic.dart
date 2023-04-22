import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_reverpod_udemy/data/count_data.dart';

class SoundLogic {
  static const String _soundDataUp = 'sounds/Onoma-Flash07-1.mp3';
  static const String _soundDataDown = 'sounds/Onoma-Flash08-1.mp3';
  static const String _soundDataReset = 'sounds/Onoma-Flash09-1.mp3';

  final AudioCache _cache = AudioCache();
  final AudioPlayer _audioPlayer = AudioPlayer();

  void load() {
    _cache.loadAll([_soundDataUp, _soundDataDown, _soundDataReset]);
  }

  void valueChanged(CountData oldData, CountData newData) {
    if (newData.countUp == 0 && newData.countDown == 0 && newData.count == 0) {
      playReset();
    } else if (oldData.countUp + 1 == newData.countUp) {
      playUp();
    } else if (oldData.countDown + 1 == newData.countDown) {
      playDown();
    }
  }

  void playUp() {
    _audioPlayer.play(AssetSource(_soundDataUp));
  }

  void playDown() {
    _audioPlayer.play(AssetSource(_soundDataDown));
  }

  void playReset() {
    _audioPlayer.play(AssetSource(_soundDataReset));
  }
}
