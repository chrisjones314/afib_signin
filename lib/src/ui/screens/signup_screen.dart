import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:flutter/material.dart';


//--------------------------------------------------------------------------------------
class SignupScreen extends SigninScreenBase<AFStateView, SigninScreenRouteParam> {

  //--------------------------------------------------------------------------------------
  SignupScreen(): super(AFSIScreenID.signup);

  //--------------------------------------------------------------------------------------
  @override
  AFStateView createStateView(AFAppStateArea state, SigninScreenRouteParam param) {
    return AFStateView();
  }

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePush(AFSISigninConfiguration config) {
    return AFNavigatePushAction(
      screen: AFSIScreenID.signup,
      routeParam: SigninScreenRouteParam.createReadyOncePerScreen(config: config)
    );
  }

  //--------------------------------------------------------------------------------------
  Widget buildMainControls(AFSIBuildContext<AFStateView, SigninScreenRouteParam>  context) {
    final t = context.t;
    final rows = t.column();

    _registerScreen(context, rows);

    return t.childMargin(
      margin: t.marginScreen,
      child: ListView(
        children: rows
      )
    );
  }

  //--------------------------------------------------------------------------------------
  void _registerScreen(AFSIBuildContext<AFStateView, SigninScreenRouteParam> context, List<Widget> rows) {
    final t = context.t;

   final textControllers = context.p.textControllers;

    rows.add(t.childSplashScreenTitle(text: AFSITranslationID.titleSignup));
    rows.add(t.childMargin(
      margin: t.marginEmail,
      child: t.childTextField(
      wid: AFSIWidgetID.editEmail,
      style: t.styleOnPrimary.bodyText2,
      text: context.p.email,
      controllers: textControllers,
      decoration: t.decorationTextInput(
        text: AFSIWidgetID.editEmail
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        updateRouteParam(context, context.p.copyWith(email: value));
      }
    )));
    rows.add(t.childMargin(
      margin: t.marginPassword,
      child: t.childTextField(
        wid: AFSIWidgetID.editPassword,
        controllers: textControllers,
        text: context.p.password,
        style: t.styleOnPrimary.bodyText2,
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editPassword,
        ),
        obscureText: !context.p.showPassword,
        onChanged: (value) {
          updateRouteParam(context, context.p.copyWith(password: value));
        }
    )));
    rows.add(t.childShowPasswordCheck(
      context,
      showPassword: context.p.showPassword,
      onChanged: (val) {
        updateRouteParam(context, context.p.copyWith(showPassword: val));
      }
    ));

    rows.add(t.childStatusMessage(context.t, context.p.status, context.p.statusMessage));

    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonRegister,
      onPressed: () {
          updateRouteParam(context, context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageSigningUp)));
          context.p.configuration.onSignup(context, context.p.email, context.p.password);
      },
    ));

    rows.add(t.childButtonSecondarySignin(
      wid: AFUIWidgetID.buttonBack,
      text: AFSITranslationID.backToSignin,
      onPressed: () {
        context.dispatchNavigatePop();
      },
    ));

  }
}

