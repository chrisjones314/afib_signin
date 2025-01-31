import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/state/lpis/afsi_signin_actions_lpi.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/state/stateviews/afsi_default_state_view.dart';
import 'package:flutter/material.dart';


//--------------------------------------------------------------------------------------
@immutable
class AFSIForgotPasswordScreenSPI extends SigninBaseSPI {
  AFSIForgotPasswordScreenSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard): super(context, standard);
  
  factory AFSIForgotPasswordScreenSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard) {
    return AFSIForgotPasswordScreenSPI(context, standard,
    );
  }

  void onChangedEmail(String email) {
    context.updateRouteParam(context.p.copyWith(email: email));
  }

  void onClickRecover() {
    context.updateRouteParam(context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(text: AFSITranslationID.messageResettingPassword)));
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
  static AFNavigatePushAction navigatePush({ required String email }) {
    return AFNavigatePushAction(
      launchParam: SigninScreenRouteParam.createReady(screenId: AFSIScreenID.forgotPassword, email: email)
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
      child: t.childEditEmailField(
        wid: AFSIWidgetID.editEmail,
        parentParam: context.p,
        email: context.p.email,
        onChangedEmail: spi.onChangedEmail
      )
    ));

    final extraInputs = t.childExtraInputsRegister(
      parentParam: context.p
    );
    if(extraInputs != null) {
      rows.add(extraInputs);
    }

    final statusMessage = context.p.statusMessage;
    if(statusMessage.isNotEmpty) {
      rows.add(t.childStatusMessage(context.p.status, statusMessage));
    }
    
    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonResetPassword,
      text: AFSIWidgetID.buttonResetPassword,
      onPressed: () {
        spi.onClickRecover();
      },
    ));

  }
}

