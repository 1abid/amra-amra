import 'package:flutter/material.dart';
import 'package:amra_amra/ui/registration_page_one.dart';
import 'package:amra_amra/ui/registration_page_two.dart';
import 'package:amra_amra/theme/colors.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  int currentPage = 0;
  int age = 18;
  bool isKeyboardOpen = false;

  PageController _pageController = PageController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KAmraAmraBluePrimary,
      body: SafeArea(
          child: AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        child: PageView(
          controller: _pageController,
          onPageChanged: (int index) {
            if (currentPage == 1)
              setState(() {
                currentPage = 0;
              });

            _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutSine);

            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

            setState(() {
              currentPage = index;
            });
          },
          children: <Widget>[
            PageOne(
              onSignInClick: () => print('clicked'),
            ),
            PageTwo(),
          ],
        ),
      )),
    );
  }
}
