import 'package:app_meow/pages/dashboard_page.dart';
import 'package:app_meow/tools/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitControl {
  final BuildContext context;

  InitControl(this.context);

  Future<void> init() async {
    final data = await Future.wait([
      _setUpPreferences(),
      //  _setUpMeowing(),
    ]);
    if (data.first /* && data.last*/) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardPage()));
    }
  }

  Future<bool> _setUpPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    CatSettings().setPrefs(prefs);
    await CatSettings().initUnits();
    return true;
  }

  Future<bool> _setUpMeowing() async {
    final audioPlayer = AudioPlayer();
    await audioPlayer.setLoopMode(LoopMode.one);
    await audioPlayer.setAsset('assets/audio/meowing.mp3');
    audioPlayer.play();
    return true;
  }
}
