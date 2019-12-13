import 'package:flutter/material.dart';
import 'package:amra_amra/theme/amraamra_app_theme.dart';
import 'package:amra_amra/ui/registrationPage.dart';
void main() {
  runApp(AmraAmra());
}

class AmraAmra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildAppTheme(),
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}
