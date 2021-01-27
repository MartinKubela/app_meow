import 'dart:math';

import 'package:app_meow/api/api.dart';
import 'package:app_meow/entities/cat_entity.dart';
import 'package:app_meow/pages/kittens_page.dart';
import 'package:app_meow/tools/back_navigator.dart';
import 'package:flutter/material.dart';

///Control class for [KittensPage]
class KittensControl with BackNavigator {
  final GlobalKey<KittensBuilderState> state;
  final api = Api();
  final rnd = Random();

  KittensControl(this.state);

  int _page = 1;

  ///Gets kittens from API
  Future<Iterable<Cat>> getKittens() async {
    return await api.apiCats.getAllCats(_page);
  }

  Future<void> refresh() {
    state.currentState.setState(() {
      _page = rnd.nextInt(10);
    });
  }
}
