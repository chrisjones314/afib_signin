

import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class AFSIConceptualTheme extends AFConceptualTheme {
  AFSIConceptualTheme(AFFundamentalTheme fundamentals, ThemeData themeData): super(fundamentals: fundamentals, id: AFSIThemeID.conceptual, themeData: themeData);

  //--------------------------------------------------------------------------------------
  Widget childSplashScreenTitle({dynamic text}) {
    return childText(text, style: styleOnPrimary.headline4, textAlign: TextAlign.center);
  }

  //--------------------------------------------------------------------------------------
  EdgeInsets get marginScreen {
    return EdgeInsets.all(30);
  }

  //--------------------------------------------------------------------------------------
  BoxDecoration decorationSigninBackground() {
    return BoxDecoration(
      color: colorPrimary,
    );
  }

  /// Create a button that the user is most likely to click.
  Widget childButtonPrimarySignin({
    AFWidgetID wid,
    String text,
    AFPressedDelegate onPressed,
  }) {
    return childMargin(
      margin: marginButtonsSignin,
      child: FlatButton(
        key: keyForWID(wid),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: childText(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colorPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ));
  }

  /// Create a button that the user is most likely to click.
  Widget childButtonSecondarySignin({
    AFWidgetID wid,
    String text,
    AFPressedDelegate onPressed,
  }) {
    final cop = colorOnPrimary;
    return childMargin(
      margin: marginButtonsSignin,
      child: OutlineButton(
        key: keyForWID(wid),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: cop,
        borderSide: BorderSide(color: cop),
        highlightedBorderColor: cop,
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: styleOnPrimary.bodyText2,
                ),
              ),
            ],
          ),
        ),
      ));  
  }

  EdgeInsets get marginButtonsSignin {
    return margin.v.s3;
  }

  EdgeInsets get marginEmail {
    return marginCustom(top: 5, bottom: 2);
  }

  EdgeInsets get marginPassword {
    return marginCustom(top: 1, bottom: 4);
  }

  InputDecoration decorationTextInput({
    String text,
  }) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white, 
          width: 1.0, 
          style: BorderStyle.solid 
        ));
    return InputDecoration(
      hintStyle: TextStyle(color: Colors.white),
      focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      helperStyle: TextStyle(color: Colors.white),
      focusedBorder: border,
      enabledBorder: border,
      labelText: translate(text)
    );
  }

  //--------------------------------------------------------------------------------------
  Widget childStatusMessage(AFSIConceptualTheme t, AFSISigninStatus status, String statusMessage) {
    var messageColor;
    var style;
    if(status == AFSISigninStatus.error) {
      messageColor = t.colorError;
      style = t.styleOnPrimary.bodyText2;
    } else {
      messageColor = null;
      style = t.styleOnPrimary.bodyText2;
    }
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: messageColor,
        borderRadius: BorderRadius.circular(4.0)
      ),
      margin: EdgeInsets.fromLTRB(40,0,40,0),
      alignment: Alignment.center,
      child: Text(
        statusMessage,
        key: t.keyForWID(AFSIWidgetID.loginErrorText),
        style: style
    ));    
  }

  //--------------------------------------------------------------------------------------
  Drawer drawerSignIn(AFBuildContext context) {
    return null;
  }

  Widget bottomNavigationBarSignin(AFBuildContext context) {
    return null;
  }

  Widget childShowPasswordCheck(AFBuildContext context, {
    @required bool showPassword,
    @required AFOnChangedBoolDelegate onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      child: SwitchListTile(
        title: Text("Show Password", style: styleOnPrimary.bodyText2),
        activeColor: Colors.white,
        inactiveTrackColor: Colors.red,
        controlAffinity: ListTileControlAffinity.leading,
        value: showPassword,
        onChanged: onChanged
      )); 
  }
}

void initConceptualThemes(AFConceptualThemeDefinitionContext context) {
  context.initUnlessPresent(AFSIThemeID.conceptual, createTheme: (f, t) => AFSIConceptualTheme(f, t));
}
