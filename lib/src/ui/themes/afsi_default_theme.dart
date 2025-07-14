import 'package:afib/afib_command.dart';
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AFSIDefaultTheme extends AFFunctionalTheme {
  AFSIDefaultTheme(AFThemeID id, AFFundamentalThemeState fundamentals, AFBuildContext context): super(id, fundamentals, context);

  factory AFSIDefaultTheme.create(AFThemeID id, AFFundamentalThemeState fundamentals, AFBuildContext context) {
    return AFSIDefaultTheme(id, fundamentals, context);
  }

  Widget childSplashScreenTitle({dynamic text}) {
    return childText(text: text, style: styleOnPrimary.headlineMedium, textAlign: TextAlign.center);
  }

  EdgeInsets get marginScreen {
    return EdgeInsets.only(top: 30);
  }

  double get maxWidthSigninControls {
    return 350.0;
  }

  Color get colorCursor {
    return colorOnPrimary;
  }

  Widget childEditEmailField({
    required AFWidgetID wid,
    required String email,
    required SigninScreenRouteParam parentParam,
    required ValueChanged<String> onChangedEmail,
  }) {
    return childMargin(
      margin: marginEmail,
      child: childTextField(
        screenId: context.screenId,
        wid: wid,
        style: styleOnPrimary.bodyMedium,
        expectedText: email,
        parentParam: parentParam,
        autocorrect: false,
        decoration: decorationTextInput(
          text: wid,
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: onChangedEmail
      )
    );
  }

  Widget childEditPasswordField({
    required AFWidgetID wid,
    required String password,
    required bool showPassword,
    required SigninScreenRouteParam parentParam,
    required ValueChanged<String> onChangedPassword,
    required ValueChanged<bool> onChangedShowPassword,
  }) {
    return childMargin(
      margin: marginPassword,
      child: childTextField(
        screenId: context.screenId,
        wid: wid,
        parentParam: parentParam,
        expectedText: password,
        style: styleOnPrimary.bodyMedium,
        decoration: decorationTextInput(
          text: wid,
          showPassword: showPassword,
          onPressedShowHidePassword: onChangedShowPassword,
        ),
        obscureText: !showPassword,
        autocorrect: false,
        onChanged: onChangedPassword
      )
    );
  }

  Widget childEditPasswordConfirmField({
    required AFWidgetID wid,
    required String password,
    required bool showPassword,
    required SigninScreenRouteParam parentParam,
    required ValueChanged<String> onChangedPassword,
  }) {
    return childMargin(
      margin: marginPassword,
      child: childTextField(
        screenId: context.screenId,
        wid: wid,
        parentParam: parentParam,
        expectedText: password,
        style: styleOnPrimary.bodyMedium,
        decoration: decorationTextInput(
          text: wid,
        ),
        obscureText: !showPassword,
        autocorrect: false,
        onChanged: onChangedPassword
      )
    );
  }

  Widget? childExtraInputsRegister({
    required AFScreenRouteParamWithFlutterState parentParam,
  }) {
    return null;
  }

  Widget? childExtraSectionsAccountSettings({
    required AFScreenRouteParamWithFlutterState parentParam,
  }) {
    return null;
  }


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
      overlayColor: WidgetStateProperty.all(colorOnPrimary),
      checkColor: colorOnPrimary,
      value: checked,
      onChanged: onChanged,
    )));

    cols.add(childText(text: "Stay signed in on this computer", textColor: colorOnPrimary));
    return Row(children: cols);
  }

  Widget childStandardSigninScaffold({
    required AFStateProgrammingInterface spi,
    required Widget body,
    required bool isLoading,
    required bool showBackButton,
  }) {
    final context = spi.context;
    return childScaffold(
        spi: spi,
        drawer: drawerSignIn(context),
        bottomNavigationBar: bottomNavigationBarSignin(context, showBackButton: showBackButton),
        body: Container(
          decoration: isLoading ? decorationSplashBackground() : decorationSigninBackground(),
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
  BoxDecoration decorationSplashBackground() {
    return BoxDecoration(
      color: colorPrimary,
    );
  }


  //--------------------------------------------------------------------------------------
  BoxDecoration decorationSigninBackground() {
    return BoxDecoration(
      color: colorPrimary,
    );
  }

  //--------------------------------------------------------------------------------------
  Widget iconShowPassword({ Color? color, double? size}) {
    return Icon(Icons.visibility, size: size, color: color);
  }

  //--------------------------------------------------------------------------------------
  Widget iconHidePassword({ Color? color, double? size}) {
    return Icon(Icons.visibility, size: size, color: color);
  }

  //--------------------------------------------------------------------------------------
  Widget iconGoogle({ Color? color, double? size}) {
    return Icon(Icons.android, size: size, color: color);
  }

  //--------------------------------------------------------------------------------------
  Widget iconFacebook({ Color? color, double? size}) {
    return Icon(Icons.android, size: size, color: color);
  }

  //--------------------------------------------------------------------------------------
  Widget iconEmail({ Color? color, double? size}) {
    return Icon(Icons.email, size: size, color: color);
  }

  //--------------------------------------------------------------------------------------
  Widget iconApple({ Color? color, double? size}) {
    return Icon(Icons.android, size: size, color: color);
  }


  /// Create a button that the user is most likely to click.
  Widget childButtonPrimarySignin({
    required AFWidgetID wid,
    required dynamic text,
    required AFPressedDelegate onPressed,
  }) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: colorOnPrimary,
      shape: shapeBorder(),
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
                  text: text,
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

  OutlinedBorder? shapeBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    );
  }

  /// Create a button that the user is most likely to click.
  Widget childButtonSecondarySignin({
    required AFWidgetID wid,
    required dynamic text,
    required AFPressedDelegate onPressed,
    Widget? leading,
  }) {
    final cop = colorOnPrimary;
    if(text == null) {
      text = wid;
    }
    
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: cop,
      side: BorderSide(color: cop),
      //highlightedBorderColor: cop,
      shape: shapeBorder()
    );

    final children = row();
    if(leading != null) {
      children.add(childMargin(
        margin: margin.r.biggest,  
        child: leading
      ));
    }

    children.add(Expanded(
      child: childText(
        text: text,
        textAlign: leading != null ? TextAlign.left : TextAlign.center,
        style: styleOnPrimary.bodyMedium,
      ),
    ));

    return childMargin(
      margin: marginButtonsSignin,
      child: OutlinedButton(
        key: keyForWID(wid),
        style: outlineButtonStyle,
        onPressed: onPressed,
        child: Container(
          padding: padding.biggest,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          )
        ),
      ));  
  }

  EdgeInsets get marginButtonsSignin {
    return margin.v.s3;
  }

  EdgeInsets get marginEmail {
    return marginCustom(top: 5, bottom: 3);
  }

  EdgeInsets get marginPassword {
    return marginCustom(vertical: 3);
  }

  InputDecoration decorationTextInput({
    dynamic text,
    Color colorForeground = Colors.white,
    bool? showPassword,
    ValueChanged<bool>? onPressedShowHidePassword,
  }) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(
          color: colorForeground, 
          width: 1.0, 
          style: BorderStyle.solid 
        ));
    Widget? suffixIcon;
    if(showPassword != null && onPressedShowHidePassword != null) {
      if(showPassword) {
        suffixIcon = IconButton(
          icon: iconShowPassword(color: colorForeground),
          onPressed: () => onPressedShowHidePassword(false),
        );

      } else {
        suffixIcon = IconButton(
          icon: iconHidePassword(color: colorForeground),
          onPressed: () => onPressedShowHidePassword(true)
        );
      }
    }

    return InputDecoration(
      hintStyle: TextStyle(color: colorForeground),
      focusColor: colorForeground,
      labelStyle: TextStyle(color: colorForeground),
      helperStyle: TextStyle(color: colorForeground),
      focusedBorder: border,
      enabledBorder: border,
      labelText: translate(text: text),
      suffixIcon: suffixIcon,
    );
  }

  Widget? childAppSubheading() {
    return null;
  }

  Widget childStatusMessage(AFSISigninStatus status, String statusMessage, {
    Color? colorBackground,
    TextTheme? textTheme,
  }) {
    var messageColor;
    final textThemeActual = textTheme ?? styleOnPrimary;
    final style = textThemeActual.bodyMedium;
    if(status == AFSISigninStatus.error) {
      messageColor = colorError;
    } else {
      messageColor = Colors.green;
    }
    return Container(
      padding: padding.standard,
      decoration: BoxDecoration(
        color: messageColor,
        borderRadius: borderRadius.standard,
      ),
      margin: margin.standard,
      alignment: Alignment.center,
      child: Text(
        statusMessage,
        key: keyForWID(AFSIWidgetID.loginErrorText),
        style: style
    ));    
  }

  //--------------------------------------------------------------------------------------
  Drawer? drawerSignIn(AFBuildContext context) {
    return null;
  }

  //--------------------------------------------------------------------------------------
  Widget? bottomNavigationBarSignin(AFBuildContext context, { required bool showBackButton }) {
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
        title: childText(wid: wid, style: styleOnPrimary.bodyMedium),
        activeColor: Colors.white,
        inactiveTrackColor: Colors.red,
        controlAffinity: ListTileControlAffinity.leading,
        value: showPassword,
        onChanged: onChanged
      )); 
  }

  //--------------------------------------------------------------------------------------
  Widget childDeleteAccountPreamble({
    required VoidCallback onPressedCancel,
  }) {

    final rows = column();

    final header = Container(
      child: childMarginStandard(
        child: childText(text: AFSITranslationID.titleAccountDeletionWarning, textAlign: TextAlign.center, textColor: colorOnError),
      ),
      decoration: BoxDecoration(
        color: colorError,
        borderRadius: borderRadius.t.standard,
      ),
    );

    rows.add(header);

    final warningText = childRichTextBuilderOnCard();
    warningText.writeNormal(AFSITranslationID.messageAccountDeletionWarning);
    rows.add(childMargin(
      child: warningText.toRichText(),
      margin: margin.standard
    ));

    rows.add(childButtonPrimary(
      wid: AFSIWidgetID.buttonCancelDeleteAccount,
      child: childText(text: AFSIWidgetID.buttonCancelDeleteAccount, textColor: colorOnPrimary), 
      onPressed: onPressedCancel
    ));

    return Card(
      child: childMarginStandard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: rows
        )
      )
    );
  }  

  //--------------------------------------------------------------------------------------
  Widget childDeleteAccountAction({
    required AFWidgetID widConfirmText,
    required VoidCallback onPressedDeleteNow,
    required AFScreenRouteParamWithFlutterState routeParam,
    required String confirmText,
    required ValueChanged<String> onChangedConfirmText,
    required Widget statusMessage,
  }) {
    final rows = column();

    rows.add(childMargin(
      margin: margin.v.standard,
      child: childTextField(
        screenId: context.screenId, 
        wid: widConfirmText, 
        onChanged: onChangedConfirmText,
        parentParam: routeParam,
        expectedText: confirmText,
        obscureText: true,
        decoration: decorationTextInput(
          text: AFSITranslationID.editConfirmText,
          colorForeground: colorOnSurface,
        ),      
      )
    ));

    final buttonStyle = TextButton.styleFrom(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    );

    rows.add(statusMessage);


    rows.add(TextButton(
      key: this.keyForWID(AFSIWidgetID.buttonDeleteAccountNow),
      child: childText(text: AFSIWidgetID.buttonDeleteAccountNow),
      style: buttonStyle,
      onPressed: onPressedDeleteNow,
    ));

    return Card(
      child: childMarginStandard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: rows
        )
      )
    );
  }

  Widget childSectionTitle(Object title) {
    return Container(
      margin: margin.none,
      child: childMarginStandard(
        child: childText(text: title, textColor: colorOnSecondary),
      ),
      decoration: BoxDecoration(
        color: colorSecondary,
        borderRadius: borderRadius.t.standard,    
      ),
    );
  }

}

