import 'package:app_meow/api/api.dart';
import 'package:dio/dio.dart';
import 'package:just_audio/just_audio.dart';
class InitControl {
  InitControl() {
  //  _setUpMeowing();
  }

  Future<void> _setUpMeowing() async {
    final audioPlayer = AudioPlayer();
    await audioPlayer.setLoopMode(LoopMode.one);
    await audioPlayer.setAsset('assets/audio/meowing.mp3');
    audioPlayer.play();
  }
}
