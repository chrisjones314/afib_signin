import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:flutter/material.dart';


//--------------------------------------------------------------------------------------
class ForgotPasswordScreen extends SigninScreenBase<AFStateView, SigninScreenRouteParam> {

  ForgotPasswordScreen(): super(AFSIScreenID.forgotPassword);

  //--------------------------------------------------------------------------------------
  @override
  AFStateView createStateView(AFAppStateArea state, SigninScreenRouteParam param) {
    return AFStateView();
  }

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePush(AFSISigninConfiguration actions) {
    return AFNavigatePushAction(
      screen: AFSIScreenID.forgotPassword,
      param: SigninScreenRouteParam.createLoginOncePerScreen(actions)
    );
  }

  //--------------------------------------------------------------------------------------
  Widget buildMainControls(AFSIBuildContext<AFStateView, SigninScreenRouteParam>  context) {
    final t = context.t;
    final rows = t.column();

    _forgotPasswordScreen(context, rows);

    return t.childMargin(
      margin: t.marginScreen,
      child: ListView(
      children: rows
    ));
  }

  //--------------------------------------------------------------------------------------
  void _forgotPasswordScreen(AFSIBuildContext<AFStateView, SigninScreenRouteParam> context, List<Widget> rows) {
    final t = context.t;
    final textControllers = context.p.textControllers;
    rows.add(context.t.childSplashScreenTitle(text: "Forgot Password"));

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

    rows.add(t.childStatusMessage(context.t, context.p.status, context.p.statusMessage));
    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonResetPassword,
      text: "RESET PASSWORD",
      onPressed: () {
          updateRouteParam(context, context.p.copyWith(status: AFSISigninStatus.normal, statusMessage: t.translate("Resetting password...")));
          context.p.configuration.onResetPassword(context, context.p.email);
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

