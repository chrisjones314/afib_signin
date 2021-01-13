import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/ui/afsi_connected_base.dart';
import 'package:afib_signin/ui/screens/signin_screen.dart';
import 'package:afib_signin/ui/screens/signin_screen_base.dart';
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
  static AFNavigatePushAction navigatePush(AFSITestActionConfiguration config) {
    return AFNavigatePushAction(
      screen: AFSIScreenID.signup,
      param: SigninScreenRouteParam.createLoginOncePerScreen(config)
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

    rows.add(t.childSplashScreenTitle(text: "Signup"));
    rows.add(t.childDivider());
    rows.add(t.childMargin(
      margin: t.marginEmail,
      child: t.childTextField(
      wid: AFSIWidgetID.editEmail,
      text: context.p.email,
      style: t.styleOnPrimary.bodyText2,
      controllers: textControllers,
      decoration: t.decorationTextInput(
        text: t.translate("Email"),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        updateRouteParam(context, context.p.copyWith(email: value));
      }
    )));
    rows.add(t.childDivider());
    rows.add(t.childMargin(
      margin: t.marginPassword,
      child: t.childTextField(
        wid: AFSIWidgetID.editPassword,
        text: context.p.password,
        controllers: textControllers,
        style: t.styleOnPrimary.bodyText2,
        decoration: t.decorationTextInput(
          text: t.translate("Password"),
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
      text: "SIGN UP NOW",
      onPressed: () {
          updateRouteParam(context, context.p.copyWith(status: AFSISigninStatus.normal, statusMessage: t.translate("Signing up...")));
          context.p.configuration.onSignup(context, context.p.email, context.p.password);
      },
    ));

    rows.add(t.childButtonSecondarySignin(
      wid: AFUIWidgetID.buttonBack,
      text: "Back to Login",
      onPressed: () {
        context.dispatchNavigatePop();
      },
    ));

  }
}

