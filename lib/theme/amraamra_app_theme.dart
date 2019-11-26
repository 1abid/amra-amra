import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    accentColor: KAmraAmraOrangeAccent,
    primaryColor: KAmraAmraBluePrimary,
    scaffoldBackgroundColor: KAmraAmraSurfaceWhite,
    cardColor: KAmraAmraBackgroundWhite,
    textSelectionColor: KAmraAmraOrangeAccent,
    errorColor: KAmraAmraErrorRed,
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: KAmraAmraOrangeAccent, textTheme: ButtonTextTheme.normal),
    primaryIconTheme: base.iconTheme.copyWith(
      color: KAmraAmraBlueDark,
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: KAmraAmraBlueDark);
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w100,
          fontSize: 32.0,
        ),
        title: base.title.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 24.0,
        ),
        subhead: base.subhead.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 26.0,
        ),
        subtitle: base.subtitle.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 18.0,
        ),
        body1: base.body1.copyWith(
          fontWeight: FontWeight.w200,
          fontSize: 16.0,
        ),
        body2: base.body2.copyWith(
          fontWeight: FontWeight.w200,
          fontSize: 14.0,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w800,
          fontSize: 14.0,
        ),
        caption: base.caption.copyWith(
          fontSize: 12.0,
        ),
      )
      .apply(
        fontFamily: 'Poppins',
        displayColor: KAmraAmraBlueDark,
        bodyColor: KAmraAmraBlueDark,
      );
}
