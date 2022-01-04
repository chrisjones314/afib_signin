import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/ui/stateviews/afsi_default_state_view.dart';
import 'package:flutter/material.dart';


//--------------------------------------------------------------------------------------
class ForgotPasswordScreen extends SigninScreenBase<SigninScreenRouteParam> {

  ForgotPasswordScreen(): super(AFSIScreenID.forgotPassword);

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePush(AFSISigninConfiguration config) {
    return AFNavigatePushAction(
      routeParam: SigninScreenRouteParam.createReadyOncePerScreen(screenId: AFSIScreenID.forgotPassword, config: config)
    );
  }

  //--------------------------------------------------------------------------------------
  Widget buildMainControls(AFSIBuildContext<AFSIDefaultStateView, SigninScreenRouteParam>  context) {
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
  void _forgotPasswordScreen(AFSIBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, List<Widget> rows) {
    final t = context.t;
    final textControllers = context.p.textControllers;
    rows.add(context.t.childSplashScreenTitle(text: AFSITranslationID.titleForgotPassword));

    rows.add(t.childMargin(
      margin: t.marginEmail,
      child: t.childTextField(
      wid: AFSIWidgetID.editEmail,
      text: context.p.email,
      style: t.styleOnPrimary.bodyText2,
      controllers: textControllers,
      decoration: t.decorationTextInput(
        text: AFSIWidgetID.editEmail,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        updateRouteParam(context, context.p.copyWith(email: value));
      }
    )));

    rows.add(t.childStatusMessage(context.t, context.p.status, context.p.statusMessage));
    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonResetPassword,
      text: AFSIWidgetID.buttonResetPassword,
      onPressed: () {
          updateRouteParam(context, context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageResettingPassword)));
          context.p.configuration.onResetPassword(context, context.p.email);
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

