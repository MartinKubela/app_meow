import 'package:flutter/material.dart';

import '../theme.dart';

/// Base page layout used accross pages
class PageLayout extends StatelessWidget {
  final String title;
  final Widget child;

  PageLayout({@required this.title, @required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final top = MediaQuery.of(context).padding.top;
    final screen = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: (screen * 0.3),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                '$title:',
                style: theme.textTheme.headline2,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  child,
                  SizedBox(
                    height: CatTheme.paddingHead,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
