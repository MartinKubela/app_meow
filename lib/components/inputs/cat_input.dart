import 'package:flutter/material.dart';

class CatInput extends StatelessWidget {
  final TextEditingController input;

  const CatInput(this.input, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: input,
        cursorColor: theme.primaryColor,
        decoration: InputDecoration(
            hintStyle: theme.textTheme.caption, hintText: 'Search breed...'),
      ),
    );
  }
}
