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
    context.updateRouteParam(context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageSigningUp)));
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onSignup(context.p.email, context.p.password);
  }

  void onChangedShowPassword({ required bool show }) {
     context.updateRouteParam(context.p.copyWith(showPassword: show));
  }
}


//--------------------------------------------------------------------------------------
class AFSIRegisterScreen extends SigninScreenBase<AFSIRegisterScreenSPI, SigninScreenRouteParam> {

  //--------------------------------------------------------------------------------------
  static final config = AFSIDefaultScreenConfig<AFSIRegisterScreenSPI, SigninScreenRouteParam> (
    spiCreator: AFSIRegisterScreenSPI.create,
  );

  //--------------------------------------------------------------------------------------
  AFSIRegisterScreen(): super(screenId: AFSIScreenID.signup, config: config);

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePush({ required String email }) {
    return AFNavigatePushAction(
      launchParam: SigninScreenRouteParam.createReady(screenId: AFSIScreenID.signup, email: email)
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
    rows.add(t.childMargin(
      margin: t.marginEmail,
      child: t.childTextField(
        screenId: screenId,
      wid: AFSIWidgetID.editEmail,
      style: t.styleOnPrimary.bodyText2,
      expectedText: context.p.email,
      parentParam: context.p,
      decoration: t.decorationTextInput(
        text: AFSIWidgetID.editEmail
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        spi.onChangedEmail(value);
      }
    )));
    rows.add(t.childMargin(
      margin: t.marginPassword,
      child: t.childTextField(
        screenId: screenId,
        wid: AFSIWidgetID.editPassword,
        parentParam: context.p,
        expectedText: context.p.password,
        style: t.styleOnPrimary.bodyText2,
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editPassword,
        ),
        obscureText: !context.p.showPassword,
        onChanged: (value) {
          spi.onChangedPassword(value);
        }
    )));
    rows.add(t.childShowPasswordCheck(
      context,
      showPassword: context.p.showPassword,
      onChanged: (val) {
        spi.onChangedShowPassword(show: val);
      }
    ));

    rows.add(t.childStatusMessage(spi.t, context.p.status, context.p.statusMessage));

    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonRegister,
      text: AFSIWidgetID.buttonRegister,
      onPressed: () {
        spi.onPressedRegister();
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

