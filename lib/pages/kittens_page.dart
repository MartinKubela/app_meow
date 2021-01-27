import 'package:app_meow/components/loading_indicator.dart';
import 'package:app_meow/components/page_layout.dart';
import 'package:app_meow/controls/kittens_control.dart';
import 'package:app_meow/entities/cat_entity.dart';
import 'package:app_meow/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Kittens page layout
class KittensPage extends StatelessWidget {
  final listState = GlobalKey<KittensBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final control = KittensControl(listState);
    return WillPopScope(
      onWillPop: () => control.onWillPop(context),
      child: SafeArea(
        child: Provider(
          create: (context) => control,
          child: Scaffold(
            backgroundColor: theme.accentColor,
            body: RefreshIndicator(
              onRefresh: control.refresh,
              backgroundColor: Colors.white,
              child: PageLayout(
                title: 'Kittens',
                child: KittensBuilder(
                  control,
                  key: listState,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///Separate widget to nicer UI layout
class KittensBuilder extends StatefulWidget {
  final KittensControl control;

  @override
  KittensBuilderState createState() => KittensBuilderState();

  KittensBuilder(this.control, {Key key}) : super(key: key);
}

class KittensBuilderState extends State<KittensBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.control.getKittens(),
      builder: (BuildContext context, AsyncSnapshot<Iterable<Cat>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: snapshot.data
                  .map<Widget>((e) => _CatCard(e))
                  .toList(growable: false),
            ),
          );
        } else {
          return LoadingIndicator();
        }
      },
    );
  }
}

/// Card displaying cat image
class _CatCard extends StatelessWidget {
  final Cat cat;

  _CatCard(this.cat) : super(key: ValueKey(cat.id));

  @override
  Widget build(BuildContext context) {
    final theme = (Theme.of(context));
    return Padding(
      padding: EdgeInsets.only(top: CatTheme.paddingHead),
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: theme.accentColor.withOpacity(0.5)),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            cat.imagePath,
            fit: BoxFit.cover,
            width: 300,
          ),
        ),
      ),
    );
  }
}
