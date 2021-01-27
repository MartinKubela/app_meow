import 'package:app_meow/pages/breeds_page.dart';
import 'package:app_meow/pages/favs_page.dart';
import 'package:app_meow/pages/kittens_page.dart';
import 'package:app_meow/pages/settings_page.dart';
import 'package:app_meow/tools/enums.dart';
import 'package:flutter/material.dart';

///Control class for [DashboardPage]
class DashboardControl {
  ///Resolves page based on [MenuType], then invokes its method
  resolvePage(BuildContext context, MenuType type) {
    switch (type) {
      case MenuType.kittens:
        _toKittens(context);
        break;
      case MenuType.breeds:
        _toBreeds(context);
        break;
      case MenuType.favourites:
        _toFavs(context);
        break;
      case MenuType.settings:
        _toSettings(context);
        break;
    }
  }

  /// ----- Methods redirecting to certain pages -----

  void _toKittens(context) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => KittensPage()));

  void _toBreeds(context) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => BreedsPage()));

  void _toFavs(context) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => FavsPage()));

  void _toSettings(context) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => SettingsPage()));
}
