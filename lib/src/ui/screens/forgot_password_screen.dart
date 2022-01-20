import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/ui/stateviews/afsi_default_state_view.dart';
import 'package:flutter/material.dart';


//--------------------------------------------------------------------------------------
@immutable
class ForgotPasswordSPI extends AFStateProgrammingInterface<AFSIBuildContext<AFSIDefaultStateView, SigninScreenRouteParam>> {
  static final creator = (context, screen) => ForgotPasswordSPI(context, screen);
  ForgotPasswordSPI(AFSIBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFConnectedUIBase screen): super(context, screen);

  void onUpdateEmail(String email) {
    context.updateRouteParam(screen, context.p.copyWith(email: email));
  }

  void onClickRecover() {
    final t = context.t;
    context.updateRouteParam(screen, context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageResettingPassword)));
    context.p.configuration.onResetPassword(context, context.p.email);
  }
}

//--------------------------------------------------------------------------------------
class ForgotPasswordScreen extends SigninScreenBase<ForgotPasswordSPI, SigninScreenRouteParam> {

  ForgotPasswordScreen(): super(AFSIScreenID.forgotPassword, ForgotPasswordSPI.creator);

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePush(AFSISigninConfiguration config) {
    return AFNavigatePushAction(
      routeParam: SigninScreenRouteParam.createReadyOncePerScreen(screenId: AFSIScreenID.forgotPassword, config: config)
    );
  }

  //--------------------------------------------------------------------------------------
  @override
  Widget buildWithContext(ForgotPasswordSPI spi) {
    final main = buildMainControls(spi);
    return buildMainScaffold(spi.context, main);
  }


  //--------------------------------------------------------------------------------------
  Widget buildMainControls(ForgotPasswordSPI spi) {
    final context = spi.context;
    final t = context.t;
    final rows = t.column();

    _forgotPasswordScreen(spi, rows);

    return t.childMargin(
      margin: t.marginScreen,
      child: ListView(
      children: rows
    ));
  }

  //--------------------------------------------------------------------------------------
  void _forgotPasswordScreen(ForgotPasswordSPI spi, List<Widget> rows) {
    final context = spi.context;
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
        spi.onUpdateEmail(value);
      }
    )));

    rows.add(t.childStatusMessage(context.t, context.p.status, context.p.statusMessage));
    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonResetPassword,
      text: AFSIWidgetID.buttonResetPassword,
      onPressed: () {
        spi.onClickRecover();
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

