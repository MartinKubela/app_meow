import 'package:app_meow/api/api.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';

class InitControl {
  InitControl() {
    final di = KiwiContainer();
    di.clear();
   di.registerSingleton<Api>((c) => Api());
  }
}
