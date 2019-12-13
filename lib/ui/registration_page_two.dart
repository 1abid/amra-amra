import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';
import 'package:amra_amra/widgets/number_picker.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final TextEditingController _textEditingController = TextEditingController();
  
  
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final TextStyle hintTextTheme = appTheme.textTheme.overline.copyWith(
        fontWeight: FontWeight.w200,
        fontSize: 14,
        color: KAmraAmraBackgroundWhite);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Container(
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      Image.asset('assets/images/avatar.png').image,
                ),
                Positioned(
                  bottom: 0,
                  left: 3,
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: KAmraAmraOrangeAccent,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 35.0,
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Pick your username',
            style: appTheme.textTheme.title.copyWith(
              color: KAmraAmraSurfaceWhite,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 200,
            child: TextField(
              textAlign: TextAlign.center,
              style: appTheme.textTheme.body1.copyWith(
                color: KAmraAmraOrangeAccent,
                fontWeight: FontWeight.w400
              ),
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: '@Username',
                hintStyle: hintTextTheme,
                contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              ),

            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
