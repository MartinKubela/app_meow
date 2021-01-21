import 'package:app_meow/controls/settings_control.dart';
import 'package:app_meow/theme.dart';
import 'package:app_meow/tools/enums.dart';
import 'package:app_meow/tools/extensions/string_extension.dart';
import 'package:app_meow/tools/parser.dart';
import 'package:app_meow/tools/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  final control = SettingsControl();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => control.onWillPop(context),
      child: Provider(
        create: (context) => control,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: theme.backgroundColor,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 30),
                      child: Text(
                        'Settings',
                        style: theme.textTheme.subtitle2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Units: ',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        _UnitsDropdown(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: CatTheme.paddingHead,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UnitsDropdown extends StatefulWidget {
  @override
  __UnitsDropdownState createState() => __UnitsDropdownState();
}

class __UnitsDropdownState extends State<_UnitsDropdown> {
  Units _value = CatSettings().units;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: ThemeData(canvasColor: theme.accentColor),
      child: DropdownButton(
          value: _value,
          items: Units.values
              .map<DropdownMenuItem>(
                (e) => DropdownMenuItem(
                  child: Text(CatParser.enumValueToString(e).capitalize),
                  value: e,
                ),
              )
              .toList(growable: false),
          onChanged: (e) => _updateUnits(e)),
    );
  }

  Future<void> _updateUnits(Units val) async {
    final done = await CatSettings().updateUnits(val);
    if (done) {
      setState(() {
        _value = val;
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Saved')));
      });
    }
  }
}
