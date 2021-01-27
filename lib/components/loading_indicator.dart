import 'package:app_meow/theme.dart';
import 'package:flutter/material.dart';

/// [CircularProgressIndicator] wrapped with additional widget just for simplify
class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: CatTheme.paddingHead),
        child: CircularProgressIndicator(),
      ),
    );
  }

  const LoadingIndicator({Key key}) : super(key: key);
}
