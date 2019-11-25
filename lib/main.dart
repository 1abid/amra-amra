import 'package:flutter/material.dart';
import 'package:amra_amra/theme/amraamra_app_theme.dart';

void main() => runApp(AmraAmra());

class AmraAmra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildAppTheme(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Center(
          child: Text(
        'Hello World',
        style: Theme.of(context).textTheme.subhead,
      )),
    );
  }
}
