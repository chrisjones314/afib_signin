import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/register_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AFSIDefaultTheme extends AFFunctionalTheme {
  AFSIDefaultTheme(AFThemeID id, AFFundamentalThemeState fundamentals): super(id, fundamentals);

  factory AFSIDefaultTheme.create(AFThemeID id, AFFundamentalThemeState fundamentals) {
    return AFSIDefaultTheme(id, fundamentals);
  }

  //--------------------------------------------------------------------------------------
  Widget childSplashScreenTitle({dynamic text}) {
    return childText(text, style: styleOnPrimary.headline4, textAlign: TextAlign.center);
  }

  //--------------------------------------------------------------------------------------
  EdgeInsets get marginScreen {
    return EdgeInsets.only(top: 30);
  }


  //--------------------------------------------------------------------------------------
  double get maxWidthSigninControls {
    return 350.0;
  }

  Color get colorCursor {
    return colorOnPrimary;
  }

  //--------------------------------------------------------------------------------------
  Widget? childCheckRememberSignin({ 
    required BuildContext buildContext, 
    required bool checked, 
    required ValueChanged<bool?> onChanged 
  }) {
    if(!kIsWeb) {
      return null;
    }
    final cols = row();
    cols.add(Theme(data: Theme.of(buildContext).copyWith(
        unselectedWidgetColor: Colors.white,
      ),
      child: Checkbox(
      focusColor: colorOnPrimary,
      hoverColor: colorOnPrimary,
      overlayColor: MaterialStateProperty.all(colorOnPrimary),
      checkColor: colorOnPrimary,
      value: checked,
      onChanged: onChanged,
    )));

    cols.add(childText("Stay signed in on this computer", textColor: colorOnPrimary));
    return Row(children: cols);
  }

  Widget childStandardSigninScaffold({
    required AFStateProgrammingInterface spi,
    required Widget body,
  }) {
    final context = spi.context;
    return childScaffold(
        spi: spi,
        drawer: drawerSignIn(context),
        bottomNavigationBar: bottomNavigationBarSignin(context),
        body: Container(
          decoration: decorationSigninBackground(),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidthSigninControls),
                child: body
              )
            )
          )
        )
    );
  }

  //--------------------------------------------------------------------------------------
  BoxDecoration decorationSigninBackground() {
    return BoxDecoration(
      color: colorPrimary,
    );
  }

  /// Create a button that the user is most likely to click.
  Widget childButtonPrimarySignin({
    required AFWidgetID wid,
    required dynamic text,
    required AFPressedDelegate onPressed,
  }) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: colorOnPrimary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
    );

    return childMargin(
      margin: marginButtonsSignin,
      child: OutlinedButton(
        key: keyForWID(wid),
        onPressed: onPressed,
        style: flatButtonStyle,
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
    required AFWidgetID wid,
    required dynamic text,
    required AFPressedDelegate onPressed,
  }) {
    final cop = colorOnPrimary;
    if(text == null) {
      text = wid;
    }
    
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      primary: cop,
      side: BorderSide(color: cop),
      //highlightedBorderColor: cop,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );

    return childMargin(
      margin: marginButtonsSignin,
      child: OutlinedButton(
        key: keyForWID(wid),
        style: outlineButtonStyle,
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
                child: childText(
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
    dynamic text,
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

  Widget childStatusMessage(AFSIDefaultTheme t, AFSISigninStatus status, String statusMessage) {
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
  Drawer? drawerSignIn(AFBuildContext context) {
    return null;
  }

  //--------------------------------------------------------------------------------------
  Widget? bottomNavigationBarSignin(AFBuildContext context) {
    return null;
  }

  //--------------------------------------------------------------------------------------
  Widget childShowPasswordCheck(AFBuildContext context, {
    required bool showPassword,
    required AFOnChangedBoolDelegate onChanged,
  }) {
    final wid = AFSIWidgetID.showPasswordCheck;
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      child: SwitchListTile(
        key: keyForWID(wid),
        title: childText(wid, style: styleOnPrimary.bodyText2),
        activeColor: Colors.white,
        inactiveTrackColor: Colors.red,
        controlAffinity: ListTileControlAffinity.leading,
        value: showPassword,
        onChanged: onChanged
      )); 
  }
}

