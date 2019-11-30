import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 80;

  @override
  Widget build(BuildContext context) {
    final ThemeData _appTheme = Theme.of(context);
    final textPrimaryStyle = _appTheme.textTheme.headline.copyWith(
        color: KAmraAmraSurfaceWhite,
        fontWeight: FontWeight.w200,
        fontSize: 16.0);
    final textSecondaryStyle = _appTheme.textTheme.subtitle.copyWith(
        color: KAmraAmraOrangeAccent,
        fontStyle: FontStyle.italic,
        fontSize: 12.0);

    final double width = MediaQuery.of(context).size.width;

    return Material(
      color: KAmraAmraBluePrimary,
      child: Container(
        margin: EdgeInsets.only(top: 30.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: KAmraAmraBlueLight,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Container(
          color: KAmraAmraBluePrimary,
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: IconButton(
                                  icon: Icon(Icons.attachment),
                                  color: KAmraAmraBackgroundWhite,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Text(
                                      'Faysal Khalashi',
                                      style: textPrimaryStyle,
                                    ),
                                    Text(
                                      '@morty',
                                      style: textSecondaryStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Photos',
                                style: textPrimaryStyle.copyWith(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: VerticalDivider(
                                  width: 30,
                                  color: KAmraAmraSurfaceWhite,
                                ),
                              ),
                              Text(
                                'Videos',
                                style: textPrimaryStyle.copyWith(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: VerticalDivider(
                                  width: 30,
                                  color: KAmraAmraSurfaceWhite,
                                ),
                              ),
                              Text(
                                'Files',
                                style: textPrimaryStyle.copyWith(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          Image.asset('assets/images/morty.jpg').image,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
