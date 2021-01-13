import 'package:app_meow/pages/breeds_page.dart';
import 'package:app_meow/pages/kittens_page.dart';
import 'package:app_meow/tools/enums.dart';
import 'package:flutter/material.dart';

class DashboardControl {
  void _toKittens(context) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => KittensPage()));

  void _toBreeds(context) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => BreedsPage()));

  resolvePage(BuildContext context, MenuType type) {
    switch (type) {
      case MenuType.kittens:
        _toKittens(context);
        break;
      case MenuType.breeds:
        _toBreeds(context);
        break;
      case MenuType.favourites:
        // TODO: Handle this case.
        break;
    }
  }
}
