import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/state/lpis/afsi_signin_actions_lpi.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/state/stateviews/afsi_default_state_view.dart';
import 'package:flutter/material.dart';

@immutable
class AFSISigninScreenSPI extends SigninBaseSPI {
  AFSISigninScreenSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard): super(context, standard);
  
  factory AFSISigninScreenSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard) {
    return AFSISigninScreenSPI(context, standard,
    );
  }

  bool get showPassword {
    return context.p.showPassword;
  }

  void onChangedRememberMe({ required bool checked }) {
    final revised = context.p.copyWith(rememberMe: checked);
    context.updateRouteParam(revised);
  }

  void onPressedSignin() {
    context.updateRouteParam(context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageSigningIn)));
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onSignin(context.p.email, context.p.password, rememberMe: context.p.rememberMe);
    
  }

  void onPressedRegister() {
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onPressedSigninRegister(email: context.p.email);
  }

  void onPressedForgotPassword() {
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onPressedSigninForgotPassword(email: context.p.email);

  }

  void onChangedShowPassword(bool checked) {
    final revised = context.p.copyWith(showPassword: checked);
    context.updateRouteParam(revised);
  }
}

/// The primary username/password signing screen, with buttons linking to forgot password
/// and register.
class AFSISigninScreen extends SigninScreenBase<AFSISigninScreenSPI, SigninScreenRouteParam> {

  //--------------------------------------------------------------------------------------
  static final config = AFSIDefaultScreenConfig<AFSISigninScreenSPI, SigninScreenRouteParam> (
    spiCreator: AFSISigninScreenSPI.create,
  );

  AFSISigninScreen(): super(screenId: AFSIScreenID.signin, config: config);

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePushReady() {
    return AFNavigatePushAction(
      launchParam: SigninScreenRouteParam.createReady(screenId: AFSIScreenID.signin),
    );
  }

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePushLoading() {
    return AFNavigatePushAction(
      launchParam: SigninScreenRouteParam.createLoading(screenId: AFSIScreenID.signin),
    );
  }

  //--------------------------------------------------------------------------------------
  static AFNavigateReplaceAllAction navigateAfterSignout({
    required String email,
  }) {
    return AFNavigateReplaceAllAction(
      launchParam: SigninScreenRouteParam.createReady(screenId: AFSIScreenID.signin, email: email),
    );
  }


  //--------------------------------------------------------------------------------------
  @override
  Widget buildWithSPI(AFSISigninScreenSPI spi) {
    final main = buildMainControls(spi);
    return buildMainScaffold(spi, main);
  }


  //--------------------------------------------------------------------------------------
  Widget buildMainControls(AFSISigninScreenSPI spi) {
    final t = spi.t;
    final widgets = t.column();

    if (spi.isLoading) {
      return _buildSignInWait(spi);
    } else {
      _loginScreen(spi, widgets);
    }

    return t.childMargin(
      margin: t.marginScreen,
      child: ListView(
        children: widgets
      )
    );
  }

  //--------------------------------------------------------------------------------------
  Widget _buildSignInWait(
    AFSISigninScreenSPI spi
  ) {
    final context = spi.context;
    final t = spi.t;
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: t.childText(context.p.statusMessage, textColor: t.colorOnError)
      )
    );
  }

  //--------------------------------------------------------------------------------------
  void _loginScreen(AFSISigninScreenSPI spi, List<Widget> rows) {
    final context = spi.context;
    final t = spi.t;

    rows.add(
      t.childSplashScreenTitle(text: AFUITranslationID.appTitle)
    );

    rows.add(t.childEditEmailField(
        wid: AFSIWidgetID.editEmail,
        parentParam: context.p,
        email: context.p.email,
        onChangedEmail: spi.onChangedEmail
      )
    );

    rows.add(t.childEditPasswordField(
        wid: AFSIWidgetID.editPassword,
        parentParam: context.p,
        password: context.p.password,
        showPassword: context.p.showPassword,
        onChangedPassword: spi.onChangedPassword
      )
    );

    final showPasswordCheck = t.childShowPasswordCheck(context, 
      showPassword: spi.showPassword, 
      onChanged: spi.onChangedShowPassword
    );

    if(showPasswordCheck != null) {
      rows.add(showPasswordCheck);
    }


    final rememberSigninCheck = t.childCheckRememberSignin(
      buildContext: context.c,
    
      checked: context.p.rememberMe,
      onChanged: (newVal) {
        if(newVal != null) {
          spi.onChangedRememberMe(checked: newVal);
        }
      }
    );

    if(rememberSigninCheck != null) {
      rows.add(rememberSigninCheck);
    }
    
    final extraInputs = t.childExtraInputsRegister(
      parentParam: context.p
    );
    if(extraInputs != null) {
      rows.add(extraInputs);
    }

    rows.add(t.childStatusMessage(context.p.status, context.p.statusMessage));

    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonLogin,
      text: AFSIWidgetID.buttonLogin,
      onPressed: spi.onPressedSignin
    ));
    
    rows.add(t.childButtonSecondarySignin(
      wid: AFSIWidgetID.buttonSignup,
      text: AFSIWidgetID.buttonSignup,
      onPressed: spi.onPressedRegister
    ));

    rows.add(t.childButtonSecondarySignin( 
      wid: AFSIWidgetID.buttonForgotPassword,
      text: AFSIWidgetID.buttonForgotPassword,
      onPressed: spi.onPressedForgotPassword
    ));
  }
}

