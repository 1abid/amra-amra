import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';

class PageOne extends StatelessWidget {
  final VoidCallback onSignInClick;

  PageOne({
    Key key,
    @required this.onSignInClick,
  })  : assert(onSignInClick != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final TextStyle headline = appTheme.textTheme.headline.copyWith(
      color: KAmraAmraSurfaceWhite,
      fontWeight: FontWeight.w500,
    );
    final TextStyle slogan = appTheme.textTheme.title.copyWith(
      color: KAmraAmraSurfaceWhite,
    );
    final TextStyle buttonText = appTheme.textTheme.button.copyWith(
      color: KAmraAmraSurfaceWhite,
      fontWeight: FontWeight.w800,
    );
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 250),
          child: Image.asset(
            'assets/icons/happy.png',
            height: 100,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            'আমরা আমরা',
            style: headline,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 30.0),
          child: Text(
            'আমাগো প্রাইভেট ম্যাসেঞ্জার',
            style: slogan,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100),
          child: ButtonTheme(
            height: 40,
            child: FlatButton.icon(
              color: Colors.transparent,
              onPressed: () => onSignInClick(),
              icon: Image.asset(
                'assets/icons/google_icon.png',
                height: 25,
              ),
              label: Text(
                'Sign in with Google',
                style: buttonText,
              ),
            ),
          ),
        )
      ],
    ));
  }
}
