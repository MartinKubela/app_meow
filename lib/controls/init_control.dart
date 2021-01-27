import 'package:app_meow/pages/dashboard_page.dart';
import 'package:app_meow/tools/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Control class for [InitPage]
///
/// Class is responsible for handling initial page logic such as
/// initializing settings, setting up meowing and potencional other stuff
class InitControl {
  /// Context of page, use
  final BuildContext context;

  InitControl(this.context);

  ///Initial method
  Future<void> init() async {
    ///Waits until both init functions completes
    final data = await Future.wait([
      _setUpPreferences(),
      _setUpMeowing(),
    ]);

    ///If both methods completes successfully redirect to [DashboardPage]
    if (data.first && data.last) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardPage()));
    }
  }

  /// Sets up [SharedPreferences] for offline storage
  ///
  /// Invokes init of units
  Future<bool> _setUpPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    CatSettings().setPrefs(prefs);
    await CatSettings().initUnits();
    return true;
  }

  /// Sets up meowing :))
  Future<bool> _setUpMeowing() async {
    final audioPlayer = AudioPlayer();
    await audioPlayer.setLoopMode(LoopMode.one);
    await audioPlayer.setAsset('assets/audio/meowing.mp3');
    audioPlayer.play();
    return true;
  }
}
