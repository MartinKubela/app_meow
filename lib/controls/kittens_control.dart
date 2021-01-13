import 'package:app_meow/api/api.dart';
import 'package:app_meow/entities/cat_entity.dart';
import 'package:app_meow/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class KittensControl {
  final api = Api();

  Future<Iterable<Cat>> getKittens() async {
    return await api.apiCats.getAllCats();
  }

  Future<bool> onWillPop(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DashboardPage()));
    return Future.value(false);
  }
}
