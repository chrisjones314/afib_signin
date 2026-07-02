import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_flutter.dart';
import 'package:flutter/material.dart';

//--------------------------------------------------------------------------------------
@immutable
class AFSIRegisterScreenSPI extends SigninBaseSPI {
  AFSIRegisterScreenSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard): super(context, standard);
  
  factory AFSIRegisterScreenSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard) {
    return AFSIRegisterScreenSPI(context, standard,
    );
  }

  void onPressedRegister() {
    context.updateRouteParam(context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(text: AFSITranslationID.messageSigningUp)));
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    if(!lpi.isPasswordConfirmMatch(context.p.password, context.p.passwordConfirm)) {
      final lpiManipulate = context.accessLPI<AFSIManipulateStateLPI>(AFSILibraryProgrammingInterfaceID.manipulateState);
      lpiManipulate.updateRegisterScreenStatus(status: AFSISigninStatus.error, message: "Passwords do not match.");
      return;
    }

    lpi.onSignup(context.p.email, context.p.password);
  }

  void onChangedShowPassword() {
     context.updateRouteParam(context.p.copyWith(showPassword: !context.p.showPassword));
  }
}


//--------------------------------------------------------------------------------------
class AFSIRegisterScreen extends SigninScreenBase<AFSIRegisterScreenSPI, SigninScreenRouteParam> {

  //--------------------------------------------------------------------------------------
  static final config = AFSIDefaultScreenConfig<AFSIRegisterScreenSPI, SigninScreenRouteParam> (
    spiCreator: AFSIRegisterScreenSPI.create,
  );

  //--------------------------------------------------------------------------------------
  AFSIRegisterScreen(): super(screenId: AFSIScreenID.register, config: config);

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePush({ required String email, bool showPassword = false }) {
    return AFNavigatePushAction(
      launchParam: SigninScreenRouteParam.createReady(screenId: AFSIScreenID.register, email: email, showPassword: showPassword)
    );
  }

  //--------------------------------------------------------------------------------------
  @override
  Widget buildWithSPI(AFSIRegisterScreenSPI spi) {
    final main = buildMainControls(spi);
    return buildMainScaffold(spi, main);
  }

  //--------------------------------------------------------------------------------------
  Widget buildMainControls(AFSIRegisterScreenSPI spi) {
    final t = spi.t;
    final rows = t.column();

    _registerScreen(spi, rows);

    return t.childMargin(
      margin: t.marginScreen,
      child: ListView(
        children: rows
      )
    );
  }

  //--------------------------------------------------------------------------------------
  void _registerScreen(AFSIRegisterScreenSPI spi, List<Widget> rows) {
    final context = spi.context;
    final t = spi.t;

    rows.add(t.childSplashScreenTitle(text: AFSITranslationID.titleSignup));

    t.childSplashHero(rows, 
      title: "Create account",
      subtitle: "Join us",
    );

    t.childUnderlineField(
      rows: rows,
      label: "EMAIL",
      obscure: false,
      hint: "you@example.com",
      wid: AFSIWidgetID.editEmail,
      parentParam: context.p,
      value: context.p.email,
      onChangedEmail: spi.onChangedEmail
    );

    rows.add(SizedBox(height: 16.0));

    t.childUnderlineField(
        rows: rows,
        label: "PASSWORD",
        obscure: !context.p.showPassword,
        wid: AFSIWidgetID.editPassword,
        parentParam: context.p,
        value: context.p.password,
        onChangedEmail: spi.onChangedPassword,
        onPressedShowObscure: spi.onChangedShowPassword,
      );

    rows.add(SizedBox(height: 16.0));

    t.childUnderlineField(
        rows: rows,
        label: "CONFIRM PASSWORD",
        obscure: !context.p.showPassword,
        wid: AFSIWidgetID.editPasswordConfirm,
        parentParam: context.p,
        value: context.p.passwordConfirm,
        onChangedEmail: spi.onChangedPasswordConfirm,
        onPressedShowObscure: spi.onChangedShowPassword,
      );
    rows.add(SizedBox(height: 16.0));

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
      wid: AFSIWidgetID.buttonRegister,
      text: AFSIWidgetID.buttonRegister,
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

