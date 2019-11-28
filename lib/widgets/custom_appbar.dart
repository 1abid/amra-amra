import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 120;

  @override
  Widget build(BuildContext context) {
    final ThemeData _appTheme = Theme.of(context);
    final textPrimaryStyle = _appTheme.textTheme.headline.copyWith(
      color: KAmraAmraSurfaceWhite,
      fontWeight: FontWeight.w200,
      fontSize: 28.0
    );
    final textSecondaryStyle = _appTheme.textTheme.subtitle.copyWith(
      color: KAmraAmraOrangeAccent,
      fontStyle: FontStyle.italic,
    );

    final double width = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
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
          padding: EdgeInsets.only(top: 30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
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
                      SizedBox(
                        height: 5.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 30,
                          padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Photos',
                                style: textPrimaryStyle.copyWith(fontSize: 16.0),
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
                                style: textPrimaryStyle.copyWith(fontSize: 16.0),
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
                                style: textPrimaryStyle.copyWith(fontSize: 16.0),
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
                      radius: 40,
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
