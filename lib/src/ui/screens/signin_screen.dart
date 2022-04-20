import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/ui/screens/register_screen.dart';
import 'package:afib_signin/src/state/stateviews/afsi_default_state_view.dart';
import 'package:afib_signin/src/ui/themes/afsi_default_theme.dart';
import 'package:flutter/material.dart';

@immutable
class AFSISigninScreenSPI extends SigninBaseSPI {
  AFSISigninScreenSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFScreenID screenId, AFSIDefaultTheme theme): super(context, screenId, theme);
  
  factory AFSISigninScreenSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFSIDefaultTheme theme, AFScreenID screenId, ) {
    return AFSISigninScreenSPI(context, screenId, theme,
    );
  }

  void onTapSignin() {
    updateRouteParam(context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageSigningIn)));
    context.p.configuration.onSignin(context, context.p.email, context.p.password, rememberMe: context.p.rememberMe);
  }

  void onTapRegister() {
    navigatePush(AFSIRegisterScreen.navigatePush(context.p.configuration));      
  }

  void onTapForgotPassword() {
    navigatePush(ForgotPasswordScreen.navigatePush(context.p.configuration));    
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
  static AFNavigatePushAction navigatePushReady(AFSISigninConfiguration config) {
    return AFNavigatePushAction(
      routeParam: SigninScreenRouteParam.createReadyOncePerScreen(screenId: AFSIScreenID.signin, config: config),
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
    final context = spi.context;
    final t = spi.t;
    final widgets = t.column();

    if (context.p.status == AFSISigninStatus.loading) {
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
    rows.add(t.childMargin(
      margin: t.marginEmail,
      child: t.childTextField(
        screenId: screenId,
      wid: AFSIWidgetID.editEmail,
      style: t.styleOnPrimary.bodyText2,
      expectedText: context.p.email,
      cursorColor: t.colorCursor,
      parentParam: spi.context.p,
      decoration: t.decorationTextInput(
        text: AFSIWidgetID.editEmail,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        spi.onEditEmail(value);
      }
    )));
    rows.add(t.childMargin(
      margin: t.marginPassword,
      child: t.childTextField(
        screenId: screenId,
        wid: AFSIWidgetID.editPassword,
        parentParam: spi.context.p,
        expectedText: context.p.password,
        style: t.styleOnPrimary.bodyText2,
        cursorColor: t.colorCursor,
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editPassword,
        ),
        obscureText: true,
        onChanged: (value) {
          spi.onEditPassword(value);
        }
    )));
    final rememberSigninCheck = t.childCheckRememberSignin(
      buildContext: context.c,
      checked: context.p.rememberMe,
      onChanged: (newVal) {
        final revised = context.p.copyWith(rememberMe: newVal);
        spi.updateRouteParam(revised);
      }
    );
    if(rememberSigninCheck != null) {
      rows.add(rememberSigninCheck);
    }
    
    rows.add(t.childStatusMessage(spi.t, context.p.status, context.p.statusMessage));

    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonLogin,
      text: AFSIWidgetID.buttonLogin,
      onPressed: () {
        spi.onTapSignin();
      },
    ));
    
    rows.add(t.childButtonSecondarySignin(
      wid: AFSIWidgetID.buttonSignup,
      text: AFSIWidgetID.buttonSignup,
      onPressed: () {
        spi.onTapRegister();
      },
    ));

    rows.add(t.childButtonSecondarySignin( 
      wid: AFSIWidgetID.buttonForgotPassword,
      text: AFSIWidgetID.buttonForgotPassword,
      onPressed: () {
        spi.onTapForgotPassword();
      },
    ));
  }
}

