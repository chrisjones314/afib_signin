import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_flutter.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:flutter/material.dart';


//!af_extra_imports


// ignore_for_file: unused_import
@immutable
class SocialSigninChoiceScreenSPI extends SigninBaseSPI {
  SocialSigninChoiceScreenSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard): super(context, standard);
  
  factory SocialSigninChoiceScreenSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard) {
    return SocialSigninChoiceScreenSPI(context, standard,
    );
  }

  
  //!af_spi_resolve_methods
  
  //!af_spi_on_update_methods
  void onPressedGoogleSignin() {
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onPressedGoogleSignin();
  }

  void onPressedAppleSignin() {
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onPressedAppleSignin();
  }

  void onPressedFacebookSignin() {
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onPressedFacebookSignin();
  }

  void onPressedEmailSignin() {
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onPressedEmailSignin();
  }

}

class SocialSigninChoiceScreen extends SigninScreenBase<SocialSigninChoiceScreenSPI, SigninScreenRouteParam> {
  static final config = AFSIDefaultScreenConfig<SocialSigninChoiceScreenSPI, SigninScreenRouteParam> (
    spiCreator: SocialSigninChoiceScreenSPI.create,  
  );

  SocialSigninChoiceScreen(): super(    
    screenId: AFSIScreenID.socialSigninChoice, 
    config: config
  );

  static AFNavigatePushAction navigateAfterSignout() {
    return navigatePushReady();
  }

  static AFNavigatePushAction navigatePushReady() {
    return AFNavigatePushAction(
      launchParam: SigninScreenRouteParam.createReady(screenId: AFSIScreenID.socialSigninChoice),
    );
  }

  static AFNavigatePushAction navigatePushLoading() {
    return AFNavigatePushAction(
      launchParam: SigninScreenRouteParam.createLoading(screenId: AFSIScreenID.socialSigninChoice),
    );
  }

  //--------------------------------------------------------------------------------------
  @override
  Widget buildWithSPI(SocialSigninChoiceScreenSPI spi) {
    final main = buildMainControls(spi);
    return buildMainScaffold(spi, main, showBackButton: false);
  }

  void _buildChoiceScreen(SocialSigninChoiceScreenSPI spi, List<Widget> rows) {
    final t = spi.t;
    rows.add(
      t.childMargin(
        margin: t.margin.b.biggest,
        child: t.childSplashScreenTitle(text: AFUITranslationID.appTitle)
      )
    );

    final iconSize = 20.0;
    final iconColor = t.colorOnPrimary;

    final introWidget = t.childAppSubheading();
    if(introWidget != null) {
      rows.add(introWidget);
    }


    rows.add(t.childButtonSecondarySignin(
      wid: AFSIWidgetID.buttonGoogleSignin,
      leading: t.iconGoogle(size: iconSize, color: iconColor),
      text: "Continue with Google",
      onPressed: spi.onPressedGoogleSignin
    ));

    rows.add(t.childButtonSecondarySignin(
      wid: AFSIWidgetID.buttonSigninApple,
      leading: t.iconApple(size: iconSize, color: iconColor),
      text: "Continue with Apple",
      onPressed: spi.onPressedAppleSignin
    ));

    /*
    rows.add(t.childButtonSecondarySignin(
      wid: AFSIWidgetID.buttonSigninFacebook,
      leading: t.iconFacebook(size: iconSize, color: iconColor),
      text: "Continue with Facebook",
      onPressed: spi.onPressedFacebookSignin
    ));
    */

    rows.add(t.childButtonSecondarySignin(
      wid: AFSIWidgetID.buttonSigninEmail,
      leading: t.iconEmail(size: iconSize, color: iconColor),
      text: "Continue with Email",
      onPressed: spi.onPressedEmailSignin
    ));

    final statusMessage = spi.statusMessage;
    if(statusMessage.isNotEmpty) {
      rows.add(t.childStatusMessage(spi.status, statusMessage));
    }

  }


  Widget buildMainControls(SocialSigninChoiceScreenSPI spi) {
    final t = spi.t;
    final rows = t.column();

    if (spi.isLoading) {
      return buildSignInWait(spi);
    } else {
      _buildChoiceScreen(spi, rows);
    }


    return ListView(
      children: rows
    );
  }

  
}