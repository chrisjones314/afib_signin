import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/state/lpis/afsi_signin_actions_lpi.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/state/stateviews/afsi_default_state_view.dart';
import 'package:afib_signin/src/ui/themes/afsi_default_theme.dart';
import 'package:flutter/material.dart';


//--------------------------------------------------------------------------------------
@immutable
class AFSIForgotPasswordScreenSPI extends SigninBaseSPI {
  AFSIForgotPasswordScreenSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFScreenID screenId, AFSIDefaultTheme theme): super(context, screenId, theme, );
  
  factory AFSIForgotPasswordScreenSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFSIDefaultTheme theme, AFScreenID screenId, ) {
    return AFSIForgotPasswordScreenSPI(context, screenId, theme,
    );
  }

  void onChangedEmail(String email) {
    context.updateRouteParam(context.p.copyWith(email: email));
  }

  void onClickRecover() {
    context.updateRouteParam(context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageResettingPassword)));
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onResetPassword(context.p.email);
  }
}

//--------------------------------------------------------------------------------------
class AFSIForgotPasswordScreen extends SigninScreenBase<AFSIForgotPasswordScreenSPI, SigninScreenRouteParam> {

  AFSIForgotPasswordScreen(): super(screenId: AFSIScreenID.forgotPassword, config: config);

  //--------------------------------------------------------------------------------------
  static final config = AFSIDefaultScreenConfig<AFSIForgotPasswordScreenSPI, SigninScreenRouteParam> (
    spiCreator: AFSIForgotPasswordScreenSPI.create,
  );

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePush() {
    return AFNavigatePushAction(
      param: SigninScreenRouteParam.createReadyOncePerScreen(screenId: AFSIScreenID.forgotPassword)
    );
  }

  //--------------------------------------------------------------------------------------
  @override
  Widget buildWithSPI(AFSIForgotPasswordScreenSPI spi) {
    final main = buildMainControls(spi);
    return buildMainScaffold(spi, main);
  }


  //--------------------------------------------------------------------------------------
  Widget buildMainControls(AFSIForgotPasswordScreenSPI spi) {
    final t = spi.t;
    final rows = t.column();

    _forgotPasswordScreen(spi, rows);

    return t.childMargin(
      margin: t.marginScreen,
      child: ListView(
      children: rows
    ));
  }

  //--------------------------------------------------------------------------------------
  void _forgotPasswordScreen(AFSIForgotPasswordScreenSPI spi, List<Widget> rows) {
    final context = spi.context;
    final t = spi.t;
    rows.add(t.childSplashScreenTitle(text: AFSITranslationID.titleForgotPassword));

    rows.add(t.childMargin(
      margin: t.marginEmail,
      child: t.childTextField(
      screenId: screenId,
      wid: AFSIWidgetID.editEmail,
      expectedText: context.p.email,
      style: t.styleOnPrimary.bodyText2,
      parentParam: spi.context.p,
      decoration: t.decorationTextInput(
        text: AFSIWidgetID.editEmail,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        spi.onChangedEmail(value);
      }
    )));

    rows.add(t.childStatusMessage(spi.t, context.p.status, context.p.statusMessage));
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
        spi.onPressedStandardBackButton();
      },
    ));

  }
}

