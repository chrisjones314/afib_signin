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
    context.updateRouteParam(context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(text: AFSITranslationID.messageSigningIn)));
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onSignin(context.p.email, context.p.password, rememberMe: context.p.rememberMe);
    context.executeWireframeEvent(AFSIWidgetID.buttonLogin, context.p);
        
  }

  void onPressedRegister() {
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onPressedSigninRegister(email: context.p.email);
    context.executeWireframeEvent(AFSIWidgetID.buttonRegister, context.p);
  }

  void onPressedGoogle() {

  }

  void onPressedFacebook() {
    
  }

  void onPressedApple() {
    
  }

  void onPressedForgotPassword() {
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onPressedSigninForgotPassword(email: context.p.email);
    context.executeWireframeEvent(AFSIWidgetID.buttonResetPassword, context.p);
  }

  void onChangedShowPassword() {
    final revised = context.p.copyWith(showPassword: !context.p.showPassword);
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
    return buildMainScaffold(spi, main, showBackButton: false);
  }


  //--------------------------------------------------------------------------------------
  Widget buildMainControls(AFSISigninScreenSPI spi) {
    final t = spi.t;
    final widgets = t.column();

    if (spi.isLoading) {
      return buildSignInWait(spi);
    } else {
      _loginScreen(spi, widgets);
    }

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widgets
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

    t.childSplashHero(rows);

    t.childUnderlineField(
        rows: rows,
        label: "EMAIL",
        wid: AFSIWidgetID.editEmail,
        obscure: false,
        parentParam: context.p,
        value: context.p.email,
        onChangedEmail: spi.onChangedEmail
      );

    rows.add(const SizedBox(height: 18));

    t.childUnderlineField(
        rows: rows,
        label: "PASSWORD",
        obscure: !context.p.showPassword,
        wid: AFSIWidgetID.editPassword,
        parentParam: context.p,
        value: context.p.password,
        onChangedEmail: spi.onChangedPassword,
        onPressedShowObscure: spi.onChangedShowPassword,
        onPressedForgotPassword: spi.onPressedForgotPassword,
      );
    /*
    rows.add(t.childEditPasswordField(
        wid: AFSIWidgetID.editPassword,
        parentParam: context.p,
        password: context.p.password,
        showPassword: context.p.showPassword,
        onChangedPassword: spi.onChangedPassword,
        onChangedShowPassword: spi.onChangedShowPassword
      ) 
    );
    */


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


    final statusMessage = context.p.statusMessage;
    if(statusMessage.isNotEmpty) {
      rows.add(t.childStatusMessage(context.p.status, statusMessage));
    }

    rows.add(const SizedBox(height: 8));
    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonLogin,
      text: AFSIWidgetID.buttonLogin,
      onPressed: spi.onPressedSignin
    ));

    t.childNewHereRows(rows);

    rows.add(t.childButtonSecondarySignin(
      wid: AFSIWidgetID.buttonSignup,
      text: AFSIWidgetID.buttonSignup,
      onPressed: spi.onPressedRegister
    ));

    t.childFooterRows(rows,
      onPressedSupport: spi.onPressedSupportLink
    );

    rows.add(t.childSupportLink(
      wid: AFSIWidgetID.linkSupport,
      onPressed: spi.onPressedSupportLink
    ));
  }

}

